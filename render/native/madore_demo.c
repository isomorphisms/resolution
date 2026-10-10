/*
 * Madore surface exercises for the resolution repository.
 *
 * David A. Madore — The Cubic Surfaces DVD (2006)
 * Original project, animations, and POV-Ray source:
 *   http://www.madore.org/cubic-dvd/
 * Exact imported source used below:
 *   vendor/david-madore/cubic-dvd/upstream/cubic-dvd/03s01a.pov
 *
 * Credit: David A. Madore created the original mathematical animations and
 * released the DVD and its source into the public domain.
 *
 * Relationship to original:
 * - the A1 and Cayley exercises are inspired by Madore's fixed clipping sphere,
 *   three-colour lighting, and deterministic film clock;
 * - render_madore_03s01a is adapted from 03s01a.pov's exact polynomial.
 *
 * Changes to 03s01a: extract the zero set from Madore's thin CSG shell, scale
 * his radius-4 clipping ball to this renderer's unit ball, use exact first-root
 * tracing instead of shell intersection, and use the existing orthographic
 * camera/material path. Madore did not author or endorse these changes.
 *
 * Numerical rendering is provided by the SURFER C core from
 * isomorphismes/algebraic-variety-explorer-mobile, derived from Christian
 * Stussak's jsurf renderer under Apache-2.0.
 */

#include "surfer_raytracer.h"

#include <errno.h>
#include <math.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>

#ifndef M_PI
#define M_PI 3.14159265358979323846
#endif

#define FILM_FRAMES 300
#define SPECIAL_FRAME 75
#define IMAGE_WIDTH 320
#define IMAGE_HEIGHT 320

static int make_directory(const char *path)
{
    if (mkdir(path, 0777) == 0 || errno == EEXIST) {
        return 1;
    }
    fprintf(stderr, "cannot create %s: %s\n", path, strerror(errno));
    return 0;
}

static double a1_deformation_parameter(int frame)
{
    const double phase = 2.0 * M_PI *
        ((double)frame - (double)SPECIAL_FRAME) / (double)FILM_FRAMES;
    return 0.18 * 0.5 * (1.0 - cos(phase));
}

static surfer_scene madore_style_scene(const surfer_prepared_surface *surface)
{
    surfer_scene scene = surfer_default_scene(surface);
    const surfer_material neutral = {
        {1.0f, 1.0f, 1.0f},
        0.025f,
        0.82f,
        0.36f,
        28.0f
    };
    scene.front_material = neutral;
    scene.back_material = neutral;
    scene.background = (surfer_color){0.012f, 0.014f, 0.020f};
    scene.light_count = 3;
    scene.lights[0] = (surfer_light){
        true, {0.0, 100.0, 100.0}, {0.0f, 1.0f, 0.0f}, 0.95f
    };
    scene.lights[1] = (surfer_light){
        true, {100.0, 100.0, 100.0}, {1.0f, 0.0f, 0.0f}, 0.95f
    };
    scene.lights[2] = (surfer_light){
        true, {0.0, -100.0, 100.0}, {0.0f, 0.0f, 1.0f}, 0.95f
    };
    return scene;
}

static int write_ppm(
    const char *path,
    const uint32_t *pixels,
    size_t width,
    size_t height)
{
    FILE *output = fopen(path, "wb");
    if (output == NULL) {
        fprintf(stderr, "cannot open %s: %s\n", path, strerror(errno));
        return 0;
    }
    if (fprintf(output, "P6\n%zu %zu\n255\n", width, height) < 0) {
        fclose(output);
        return 0;
    }

    /* SURFER returns mathematical row order; image files use top row first. */
    for (size_t output_y = 0; output_y < height; ++output_y) {
        const size_t source_y = height - 1U - output_y;
        for (size_t x = 0; x < width; ++x) {
            const uint32_t argb = pixels[source_y * width + x];
            const unsigned char rgb[3] = {
                (unsigned char)((argb >> 16) & UINT32_C(0xff)),
                (unsigned char)((argb >> 8) & UINT32_C(0xff)),
                (unsigned char)(argb & UINT32_C(0xff))
            };
            if (fwrite(rgb, sizeof(rgb), 1, output) != 1) {
                fprintf(stderr, "write failed for %s\n", path);
                fclose(output);
                return 0;
            }
        }
    }
    if (fclose(output) != 0) {
        fprintf(stderr, "close failed for %s\n", path);
        return 0;
    }
    return 1;
}

static int render_surface(
    const char *path,
    const surfer_prepared_surface *surface,
    double yaw,
    double pitch)
{
    uint32_t *pixels = calloc(
        (size_t)IMAGE_WIDTH * (size_t)IMAGE_HEIGHT,
        sizeof(*pixels));
    if (pixels == NULL) {
        fprintf(stderr, "pixel allocation failed\n");
        return 0;
    }

    const surfer_scene scene = madore_style_scene(surface);
    const int rendered = surfer_render_orthographic(
        &scene,
        IMAGE_WIDTH,
        IMAGE_HEIGHT,
        2.12,
        yaw,
        pitch,
        1.0,
        pixels);
    const int written = rendered && write_ppm(
        path,
        pixels,
        IMAGE_WIDTH,
        IMAGE_HEIGHT);
    free(pixels);
    if (!rendered) {
        fprintf(stderr, "renderer rejected scene for %s\n", path);
    }
    return written;
}

static int render_a1_frame(const char *output_directory, int frame, FILE *manifest)
{
    const double epsilon = a1_deformation_parameter(frame);
    const surfer_term surface_terms[] = {
        {1.0, 2, 0, 0},
        {1.0, 0, 2, 0},
        {-1.0, 0, 0, 2},
        {-epsilon, 0, 0, 0}
    };
    const surfer_term gradient_x_terms[] = {{2.0, 1, 0, 0}};
    const surfer_term gradient_y_terms[] = {{2.0, 0, 1, 0}};
    const surfer_term gradient_z_terms[] = {{-2.0, 0, 0, 1}};
    const surfer_prepared_surface surface = {
        2,
        {surface_terms, sizeof(surface_terms) / sizeof(surface_terms[0])},
        {gradient_x_terms, 1},
        {gradient_y_terms, 1},
        {gradient_z_terms, 1}
    };

    char path[4096];
    const int length = snprintf(
        path,
        sizeof(path),
        "%s/a1-frame-%03d.ppm",
        output_directory,
        frame);
    if (length < 0 || (size_t)length >= sizeof(path)) {
        fprintf(stderr, "output path is too long\n");
        return 0;
    }
    if (!render_surface(path, &surface, 0.56, -0.34)) {
        return 0;
    }
    fprintf(
        manifest,
        "a1\t%d\t%.17g\t%s\n",
        frame,
        epsilon,
        path);
    return 1;
}

static int render_cayley(const char *output_directory, FILE *manifest)
{
    /* Affine chart w=1 of xyz + xyw + xzw + yzw = 0. */
    const surfer_term surface_terms[] = {
        {1.0, 1, 1, 1},
        {1.0, 1, 1, 0},
        {1.0, 1, 0, 1},
        {1.0, 0, 1, 1}
    };
    const surfer_term gradient_x_terms[] = {
        {1.0, 0, 1, 1},
        {1.0, 0, 1, 0},
        {1.0, 0, 0, 1}
    };
    const surfer_term gradient_y_terms[] = {
        {1.0, 1, 0, 1},
        {1.0, 1, 0, 0},
        {1.0, 0, 0, 1}
    };
    const surfer_term gradient_z_terms[] = {
        {1.0, 1, 1, 0},
        {1.0, 1, 0, 0},
        {1.0, 0, 1, 0}
    };
    const surfer_prepared_surface surface = {
        3,
        {surface_terms, sizeof(surface_terms) / sizeof(surface_terms[0])},
        {gradient_x_terms, sizeof(gradient_x_terms) / sizeof(gradient_x_terms[0])},
        {gradient_y_terms, sizeof(gradient_y_terms) / sizeof(gradient_y_terms[0])},
        {gradient_z_terms, sizeof(gradient_z_terms) / sizeof(gradient_z_terms[0])}
    };

    char path[4096];
    const int length = snprintf(
        path,
        sizeof(path),
        "%s/cayley-affine.ppm",
        output_directory);
    if (length < 0 || (size_t)length >= sizeof(path)) {
        fprintf(stderr, "output path is too long\n");
        return 0;
    }
    if (!render_surface(path, &surface, -0.72, -0.43)) {
        return 0;
    }
    fprintf(manifest, "cayley-affine\t75\t0\t%s\n", path);
    return 1;
}

static int render_madore_03s01a(const char *output_directory, FILE *manifest)
{
    /*
     * Madore 03s01a.pov uses F(X,Y,Z) = X^2 + X Z^2 + Y^3 and clips
     * with X^2 + Y^2 + Z^2 <= 16. Put X=4x, Y=4y, Z=4z and divide F
     * by 16 to obtain the unit-ball equation
     *
     *     f(x,y,z) = x^2 + 4 x z^2 + 4 y^3 = 0.
     *
     * His two opposite cubics thicken this into |F| <= 0.0001 for CSG;
     * this renderer traces the exact zero set instead.
     */
    const surfer_term surface_terms[] = {
        {1.0, 2, 0, 0},
        {4.0, 1, 0, 2},
        {4.0, 0, 3, 0}
    };
    const surfer_term gradient_x_terms[] = {
        {2.0, 1, 0, 0},
        {4.0, 0, 0, 2}
    };
    const surfer_term gradient_y_terms[] = {{12.0, 0, 2, 0}};
    const surfer_term gradient_z_terms[] = {{8.0, 1, 0, 1}};
    const surfer_prepared_surface surface = {
        3,
        {surface_terms, sizeof(surface_terms) / sizeof(surface_terms[0])},
        {gradient_x_terms, sizeof(gradient_x_terms) / sizeof(gradient_x_terms[0])},
        {gradient_y_terms, sizeof(gradient_y_terms) / sizeof(gradient_y_terms[0])},
        {gradient_z_terms, sizeof(gradient_z_terms) / sizeof(gradient_z_terms[0])}
    };

    char path[4096];
    const int length = snprintf(
        path,
        sizeof(path),
        "%s/madore-03s01a-native.ppm",
        output_directory);
    if (length < 0 || (size_t)length >= sizeof(path)) {
        fprintf(stderr, "output path is too long\n");
        return 0;
    }

    /* Match the original camera direction; projection remains orthographic. */
    if (!render_surface(path, &surface, M_PI, -atan(0.25))) {
        return 0;
    }
    fprintf(manifest, "madore-03s01a\t75\t0\t%s\n", path);
    return 1;
}

int main(int argc, char **argv)
{
    if (argc != 2) {
        fprintf(stderr, "usage: %s OUTPUT_DIRECTORY\n", argv[0]);
        return 64;
    }
    if (!make_directory(argv[1])) {
        return 1;
    }

    char manifest_path[4096];
    const int length = snprintf(
        manifest_path,
        sizeof(manifest_path),
        "%s/manifest.tsv",
        argv[1]);
    if (length < 0 || (size_t)length >= sizeof(manifest_path)) {
        fprintf(stderr, "manifest path is too long\n");
        return 1;
    }
    FILE *manifest = fopen(manifest_path, "w");
    if (manifest == NULL) {
        fprintf(stderr, "cannot open %s: %s\n", manifest_path, strerror(errno));
        return 1;
    }
    fprintf(manifest, "scene\tframe\tparameter\tfile\n");

    const int frames[] = {0, 75, 150, 225};
    int ok = 1;
    for (size_t i = 0; i < sizeof(frames) / sizeof(frames[0]); ++i) {
        ok = render_a1_frame(argv[1], frames[i], manifest) && ok;
    }
    ok = render_cayley(argv[1], manifest) && ok;
    ok = render_madore_03s01a(argv[1], manifest) && ok;
    if (fclose(manifest) != 0) {
        fprintf(stderr, "close failed for %s\n", manifest_path);
        ok = 0;
    }
    return ok ? 0 : 1;
}
