/********************************************************
 * Kernels to be optimized for the Metu Ceng Performance Lab
 ********************************************************/

#include <stdio.h>
#include <stdlib.h>
#include "defs.h"

/* 
 * Please fill in the following team struct 
 */
team_t team = {
    "Introvert",                     /* Team name */

    "Ahmet Emre KILIÇ",             /* First member full name */
    "e2380616",                 /* First member id */

    "",                         /* Second member full name (leave blank if none) */
    "",                         /* Second member id (leave blank if none) */

    "",                         /* Third member full name (leave blank if none) */
    ""                          /* Third member id (leave blank if none) */
};

/****************
 * BOKEH KERNEL *
 ****************/

/****************************************************************
 * Various typedefs and helper functions for the bokeh function
 * You may modify these any way you like.                       
 ****************************************************************/

/* A struct used to compute averaged pixel value */
typedef struct {
    int red;
    int green;
    int blue;
    int num;
} pixel_sum;

/* Compute min and max of two integers, respectively */
static int min(int a, int b) { return (a < b ? a : b); }
static int max(int a, int b) { return (a > b ? a : b); }

/* 
 * initialize_pixel_sum - Initializes all fields of sum to 0 
 */
static void initialize_pixel_sum(pixel_sum *sum) 
{
    sum->red = sum->green = sum->blue = 0;
    sum->num = 0;
    return;
}

/* 
 * accumulate_sum - Accumulates field values of p in corresponding 
 * fields of sum 
 */
static void accumulate_sum(pixel_sum *sum, pixel p) 
{
    sum->red += (int) p.red;
    sum->green += (int) p.green;
    sum->blue += (int) p.blue;
    sum->num++;
    return;
}

/* 
 * assign_sum_to_pixel - Computes averaged pixel value in current_pixel 
 */
static void assign_sum_to_pixel(pixel *current_pixel, pixel_sum sum) 
{
    current_pixel->red = (unsigned short) (sum.red/sum.num);
    current_pixel->green = (unsigned short) (sum.green/sum.num);
    current_pixel->blue = (unsigned short) (sum.blue/sum.num);
    return;
}

/* 
 * avg - Returns averaged pixel value at (i,j) 
 */
static pixel avg(int dim, int i, int j, pixel *src) 
{
    int ii, jj;
    pixel_sum sum;
    pixel current_pixel;

    initialize_pixel_sum(&sum);
    for(ii = max(i-1, 0); ii <= min(i+1, dim-1); ii++) 
    for(jj = max(j-1, 0); jj <= min(j+1, dim-1); jj++) 
        accumulate_sum(&sum, src[RIDX(ii, jj, dim)]);

    assign_sum_to_pixel(&current_pixel, sum);
    return current_pixel;
}

/*******************************************************
 * Your different versions of the bokeh kernel go here 
 *******************************************************/

/* 
 * naive_bokeh - The naive baseline version of bokeh effect with filter
 */
char naive_bokeh_descr[] = "naive_bokeh: Naive baseline bokeh with filter";
void naive_bokeh(int dim, pixel *src, short *flt, pixel *dst) {
  
    int i, j;

    for(i = 0; i < dim; i++) {
        for(j = 0; j < dim; j++) {
            if ( !flt[RIDX(i, j, dim)] )
                dst[RIDX(i, j, dim)] = avg(dim, i, j, src);
            else
                dst[RIDX(i, j, dim)] = src[RIDX(i, j, dim)];
        }
    }
}

/* 
 * bokeh - Your current working version of bokeh
 * IMPORTANT: This is the version you will be graded on
 */
char bokeh_descr[] = "bokeh: Current working version";
void bokeh(int dim, pixel *src, short *flt, pixel *dst) {
    //Just apply formula on the pdf
    int x=1;
    int y;
    
    // 0 < x < N - 1
    for(; x<dim-1; x++) {
        // y = 0 
        if(!flt[x*dim]){
            dst[x*dim].red=(src[(x-1)*dim].red+src[(x-1)*dim+1].red+src[x*dim].red+src[x*dim+1].red+src[(x+1)*dim].red+src[(x+1)*dim+1].red)/6;
            dst[x*dim].green=(src[(x-1)*dim].green+src[(x-1)*dim+1].green+src[x*dim].green+src[x*dim+1].green+src[(x+1)*dim].green+src[(x+1)*dim+1].green)/6;
            dst[x*dim].blue=(src[(x-1)*dim].blue+src[(x-1)*dim+1].blue+src[x*dim].blue+src[x*dim+1].blue+src[(x+1)*dim].blue+src[(x+1)*dim+1].blue)/6;
        }
        else dst[x*dim] = src[x*dim];
        // 0 < y < N - 1 , 2x2 loop unrolling here
        for(y=1; y<dim-1; y+=2) {
            if(!flt[RIDX(x,y,dim)]){
                dst[RIDX(x,y,dim)].red=(src[RIDX(x-1,y-1,dim)].red+src[RIDX(x-1,y,dim)].red+src[RIDX(x-1,y+1,dim)].red+src[RIDX(x,y-1,dim)].red+src[RIDX(x,y,dim)].red+src[RIDX(x,y+1,dim)].red+src[RIDX(x+1,y-1,dim)].red+src[RIDX(x+1,y,dim)].red+src[RIDX(x+1,y+1,dim)].red)/9;
                dst[RIDX(x,y,dim)].green=(src[RIDX(x-1,y-1,dim)].green+src[RIDX(x-1,y,dim)].green+src[RIDX(x-1,y+1,dim)].green+src[RIDX(x,y-1,dim)].green+src[RIDX(x,y,dim)].green+src[RIDX(x,y+1,dim)].green+src[RIDX(x+1,y-1,dim)].green+src[RIDX(x+1,y,dim)].green+src[RIDX(x+1,y+1,dim)].green)/9;
                dst[RIDX(x,y,dim)].blue=(src[RIDX(x-1,y-1,dim)].blue+src[RIDX(x-1,y,dim)].blue+src[RIDX(x-1,y+1,dim)].blue+src[RIDX(x,y-1,dim)].blue+src[RIDX(x,y,dim)].blue+src[RIDX(x,y+1,dim)].blue+src[RIDX(x+1,y-1,dim)].blue+src[RIDX(x+1,y,dim)].blue+src[RIDX(x+1,y+1,dim)].blue)/9;
            }
            else dst[RIDX(x,y,dim)] = src[RIDX(x,y,dim)]; 
            if(!flt[RIDX(x,y+1,dim)]){
                dst[RIDX(x,y+1,dim)].red=(src[RIDX(x-1,y,dim)].red+src[RIDX(x-1,y+1,dim)].red+src[RIDX(x-1,y+2,dim)].red+src[RIDX(x,y,dim)].red+src[RIDX(x,y+1,dim)].red+src[RIDX(x,y,dim)+2].red+src[RIDX(x+1,y,dim)].red+src[RIDX(x+1,y+1,dim)].red+src[RIDX(x+1,y+2,dim)].red)/9;
                dst[RIDX(x,y+1,dim)].green=(src[RIDX(x-1,y,dim)].green+src[RIDX(x-1,y+1,dim)].green+src[RIDX(x-1,y+2,dim)].green+src[RIDX(x,y,dim)].green+src[RIDX(x,y+1,dim)].green+src[RIDX(x,y,dim)+2].green+src[RIDX(x+1,y,dim)].green+src[RIDX(x+1,y+1,dim)].green+src[RIDX(x+1,y+2,dim)].green)/9;
                dst[RIDX(x,y+1,dim)].blue=(src[RIDX(x-1,y,dim)].blue+src[RIDX(x-1,y+1,dim)].blue+src[RIDX(x-1,y+2,dim)].blue+src[RIDX(x,y,dim)].blue+src[RIDX(x,y+1,dim)].blue+src[RIDX(x,y,dim)+2].blue+src[RIDX(x+1,y,dim)].blue+src[RIDX(x+1,y+1,dim)].blue+src[RIDX(x+1,y+2,dim)].blue)/9;
            }
            else dst[RIDX(x,y+1,dim)] = src[RIDX(x,y+1,dim)];
        }
        // y = N - 1
        if(!flt[RIDX(x,y,dim)]){
            dst[RIDX(x,y,dim)].red=(src[RIDX(x-1,y-1,dim)].red+src[RIDX(x-1,y,dim)].red+src[RIDX(x,y-1,dim)].red+src[RIDX(x,y,dim)].red+src[RIDX(x+1,y-1,dim)].red+src[RIDX(x+1,y,dim)].red)/6;
            dst[RIDX(x,y,dim)].green=(src[RIDX(x-1,y-1,dim)].green+src[RIDX(x-1,y,dim)].green+src[RIDX(x,y-1,dim)].green+src[RIDX(x,y,dim)].green+src[RIDX(x+1,y-1,dim)].green+src[RIDX(x+1,y,dim)].green)/6;
            dst[RIDX(x,y,dim)].blue=(src[RIDX(x-1,y-1,dim)].blue+src[RIDX(x-1,y,dim)].blue+src[RIDX(x,y-1,dim)].blue+src[RIDX(x,y,dim)].blue+src[RIDX(x+1,y-1,dim)].blue+src[RIDX(x+1,y,dim)].blue)/6;
        }
        else dst[RIDX(x,y,dim)] = src[RIDX(x,y,dim)];
    }
    // x = 0 & y = 0
    if(!flt[0]){
        dst[0].red=(src[0].red+src[1].red+src[dim].red+src[dim+1].red) >> 2;
        dst[0].green=(src[0].green+src[1].green+src[dim].green+src[dim+1].green) >> 2;
        dst[0].blue=(src[0].blue+src[1].blue+src[dim].blue+src[dim+1].blue) >> 2;
    }
    else dst[0] = src[0];
    // x = N - 1 & y = 0
    if(!flt[x*dim]){
        dst[x*dim].red=(src[(x-1)*dim].red+src[(x-1)*dim+1].red+src[x*dim].red+src[x*dim+1].red) >> 2;
        dst[x*dim].green=(src[(x-1)*dim].green+src[(x-1)*dim+1].green+src[x*dim].green+src[x*dim+1].green) >> 2;
        dst[x*dim].blue=(src[(x-1)*dim].blue+src[(x-1)*dim+1].blue+src[x*dim].blue+src[x*dim+1].blue) >> 2;
    }
    else dst[x*dim] = src[x*dim];
    // x = N - 1 & 0 < y < N-1
    for(y=1; y<dim-1; y++) {
        if(!flt[RIDX(x,y,dim)]){
            dst[RIDX(x,y,dim)].red=(src[RIDX(x-1,y-1,dim)].red+src[RIDX(x-1,y,dim)].red+src[RIDX(x-1,y+1,dim)].red+src[RIDX(x,y-1,dim)].red+src[RIDX(x,y,dim)].red+src[RIDX(x,y+1,dim)].red)/6;
            dst[RIDX(x,y,dim)].green=(src[RIDX(x-1,y-1,dim)].green+src[RIDX(x-1,y,dim)].green+src[RIDX(x-1,y+1,dim)].green+src[RIDX(x,y-1,dim)].green+src[RIDX(x,y,dim)].green+src[RIDX(x,y+1,dim)].green)/6;
            dst[RIDX(x,y,dim)].blue=(src[RIDX(x-1,y-1,dim)].blue+src[RIDX(x-1,y,dim)].blue+src[RIDX(x-1,y+1,dim)].blue+src[RIDX(x,y-1,dim)].blue+src[RIDX(x,y,dim)].blue+src[RIDX(x,y+1,dim)].blue)/6;
        }
        else dst[RIDX(x,y,dim)] = src[RIDX(x,y,dim)];
        if (!flt[y]){       // x = 0 & 0 < y < N - 1
            dst[y].red=(src[y-1].red+src[y].red+src[y+1].red+src[dim+y-1].red+src[dim+y].red+src[dim+y+1].red)/6;
            dst[y].green=(src[y-1].green+src[y].green+src[y+1].green+src[dim+y-1].green+src[dim+y].green+src[dim+y+1].green)/6;
            dst[y].blue=(src[y-1].blue+src[y].blue+src[y+1].blue+src[dim+y-1].blue+src[dim+y].blue+src[dim+y+1].blue)/6;
        }
        else dst[y] = src[y];
    }
    // x = 0 & y = N - 1
    if(!flt[y]){
        dst[y].red=(src[y].red+src[y-1].red+src[dim+y].red+src[dim+y-1].red) >> 2;
        dst[y].green=(src[y].green+src[y-1].green+src[dim+y].green+src[dim+y-1].green) >> 2;
        dst[y].blue=(src[y].blue+src[y-1].blue+src[dim+y].blue+src[dim+y-1].blue) >> 2;
    }
    else dst[y] = src[y];
    //x = N - 1 & y = N - 1
    if(!flt[RIDX(x,y,dim)]){
        dst[RIDX(x,y,dim)].red=(src[RIDX(x-1,y-1,dim)].red+src[RIDX(x-1,y,dim)].red+src[RIDX(x,y-1,dim)].red+src[RIDX(x,y,dim)].red) >> 2;
        dst[RIDX(x,y,dim)].green=(src[RIDX(x-1,y-1,dim)].green+src[RIDX(x-1,y,dim)].green+src[RIDX(x,y-1,dim)].green+src[RIDX(x,y,dim)].green) >> 2;
        dst[RIDX(x,y,dim)].blue=(src[RIDX(x-1,y-1,dim)].blue+src[RIDX(x-1,y,dim)].blue+src[RIDX(x,y-1,dim)].blue+src[RIDX(x,y,dim)].blue) >> 2; 
    }
    else dst[RIDX(x,y,dim)] = src[RIDX(x,y,dim)]; 

}


void register_bokeh_functions() 
{
    add_bokeh_function(&naive_bokeh, naive_bokeh_descr);   
    add_bokeh_function(&bokeh, bokeh_descr);   
    /* ... Register additional test functions here */
    /* add_bokeh_function(&bokeh_formula, bokeh_formula_descr); */
    /* add_bokeh_function(&bokeh_formula2, bokeh_formula2_descr); */
}

/***************************
 * HADAMARD PRODUCT KERNEL *
 ***************************/

/******************************************************
 * Your different versions of the hadamard product functions go here
 ******************************************************/

/* 
 * naive_hadamard - The naive baseline version of hadamard product of two matrices
 */
char naive_hadamard_descr[] = "naive_hadamard The naive baseline version of hadamard product of two matrices";
void naive_hadamard(int dim, int *src1, int *src2, int *dst) {
  
    int i, j;

    for(i = 0; i < dim; i++)
        for(j = 0; j < dim; j++) 
            dst[RIDX(i, j, dim)] = src1[RIDX(i, j, dim)] * src2[RIDX(i, j, dim)];
}

/* 
 * hadamard - Your current working version of hadamard product
 * IMPORTANT: This is the version you will be graded on
 */
char hadamard_descr[] = "hadamard: Current working version"; /* just unroll to 32x32 */
void hadamard(int dim, int *src1, int *src2, int *dst) 
{
    int i,j;
    for (i = 0; i < dim; i++)
        for (j = 0; j < dim; j+=32) {
            dst[RIDX(i, j , dim)] = src1[RIDX(i, j , dim)] * src2[RIDX(i, j, dim)];
            dst[RIDX(i, j + 1, dim)] = src1[RIDX(i, j + 1, dim)] * src2[RIDX(i , j +1, dim)];
            dst[RIDX(i, j +2, dim)] = src1[RIDX(i, j  +2, dim)] * src2[RIDX(i, j + 2, dim)];
            dst[RIDX(i, j + 3, dim)] = src1[RIDX(i, j + 3, dim)] * src2[RIDX(i, j + 3, dim)];
            dst[RIDX(i, j + 4, dim)] = src1[RIDX(i, j  +4, dim)] * src2[RIDX(i, j+4, dim)];
            dst[RIDX(i, j+5, dim)] = src1[RIDX(i, j+5, dim)] * src2[RIDX(i, j+5, dim)];
            dst[RIDX(i, j+6, dim)] = src1[RIDX(i, j+6, dim)] * src2[RIDX(i, j+6, dim)];
            dst[RIDX(i, j+7, dim)] = src1[RIDX(i, j+7, dim)] * src2[RIDX(i, j+7, dim)];
            dst[RIDX(i, j+8, dim)] = src1[RIDX(i, j+8, dim)] * src2[RIDX(i, j+8, dim)];
            dst[RIDX(i, j+9, dim)] = src1[RIDX(i, j+9, dim)] * src2[RIDX(i, j+9, dim)];
            dst[RIDX(i, j+10, dim)] = src1[RIDX(i, j+10, dim)] * src2[RIDX(i, j+10, dim)];
            dst[RIDX(i, j+11, dim)] = src1[RIDX(i, j+11, dim)] * src2[RIDX(i, j+11, dim)];
            dst[RIDX(i, j+12, dim)] = src1[RIDX(i, j+12, dim)] * src2[RIDX(i, j+12, dim)];
            dst[RIDX(i, j+13, dim)] = src1[RIDX(i, j+13, dim)] * src2[RIDX(i, j+13, dim)];
            dst[RIDX(i, j+14, dim)] = src1[RIDX(i, j+14, dim)] * src2[RIDX(i, j+14, dim)];
            dst[RIDX(i, j+15, dim)] = src1[RIDX(i, j+15, dim)] * src2[RIDX(i, j+15, dim)];

            dst[RIDX(i, j+16 , dim)] = src1[RIDX(i, j+16, dim)] * src2[RIDX(i, j+16, dim)];
            dst[RIDX(i, j + 17, dim)] = src1[RIDX(i, j + 17, dim)] * src2[RIDX(i , j +17, dim)];
            dst[RIDX(i, j + 18, dim)] = src1[RIDX(i, j  +18, dim)] * src2[RIDX(i, j + 18, dim)];
            dst[RIDX(i, j + 19, dim)] = src1[RIDX(i, j + 19, dim)] * src2[RIDX(i, j + 19, dim)];
            dst[RIDX(i, j + 20, dim)] = src1[RIDX(i, j  +20, dim)] * src2[RIDX(i, j+20, dim)];
            dst[RIDX(i, j+21, dim)] = src1[RIDX(i, j+21, dim)] * src2[RIDX(i, j+21, dim)];
            dst[RIDX(i, j+22, dim)] = src1[RIDX(i, j+22, dim)] * src2[RIDX(i, j+22, dim)];
            dst[RIDX(i, j+23, dim)] = src1[RIDX(i, j+23, dim)] * src2[RIDX(i, j+23, dim)];
            dst[RIDX(i, j+24, dim)] = src1[RIDX(i, j+24, dim)] * src2[RIDX(i, j+24, dim)];
            dst[RIDX(i, j+25, dim)] = src1[RIDX(i, j+25, dim)] * src2[RIDX(i, j+25, dim)];
            dst[RIDX(i, j+26, dim)] = src1[RIDX(i, j+26, dim)] * src2[RIDX(i, j+26, dim)];
            dst[RIDX(i, j+27, dim)] = src1[RIDX(i, j+27, dim)] * src2[RIDX(i, j+27, dim)];
            dst[RIDX(i, j+28, dim)] = src1[RIDX(i, j+28, dim)] * src2[RIDX(i, j+28, dim)];
            dst[RIDX(i, j+29, dim)] = src1[RIDX(i, j+29, dim)] * src2[RIDX(i, j+29, dim)];
            dst[RIDX(i, j+30, dim)] = src1[RIDX(i, j+30, dim)] * src2[RIDX(i, j+30, dim)];
            dst[RIDX(i, j+31, dim)] = src1[RIDX(i, j+31, dim)] * src2[RIDX(i, j+31, dim)];
        }
}
/*********************************************************************
 * register_hadamard_functions - Register all of your different versions
 *     of the hadamard kernel with the driver by calling the
 *     add_hadamard_function() for each test function. When you run the
 *     driver program, it will test and report the performance of each
 *     registered test function.  
 *********************************************************************/

char wo_ridx[] = "unroll_wo_ridx: basic unroll without ridx and direct pointer iteration";
void unroll_wo_ridx(int dim, int *src1, int* src2, int *dst){
    int i,j;
    for (i = 0; i < dim; i++)
        for (j = 0; j < dim; j+=32) {
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;
            *dst = *src1 * *src2; dst++; src1++; src2++;

        }

}

void register_hadamard_functions() 
{
    add_hadamard_function(&naive_hadamard, naive_hadamard_descr);   
    add_hadamard_function(&hadamard, hadamard_descr);   
    /* ... Register additional test functions here */
    /*add_hadamard_function(&hadamard2, v2);
    add_hadamard_function(&hadamard3, v3);*/
    /* add_hadamard_function(&unroll_wo_ridx, wo_ridx); */
}

