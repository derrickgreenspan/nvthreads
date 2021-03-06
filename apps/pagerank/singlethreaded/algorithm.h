/*
  Copyright 2015-2016 Hewlett Packard Enterprise Development LP
  
  This program is free software; you can redistribute it and/or modify 
  it under the terms of the GNU General Public License, version 2 as 
  published by the Free Software Foundation.

  This program is distributed in the hope that it will be useful, 
  but WITHOUT ANY WARRANTY; without even the implied warranty of 
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
  See the GNU General Public License for more details.

  You should have received a copy of the GNU General Public License 
  along with this program; if not, write to the Free Software 
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

*/
#ifndef ALGORITHM_H
#define ALGORITHM_H

#include <matrix.h>
#include <vector.h>
#include <math.h>
#include <pthread.h>
#include <utils.h>

typedef struct parallel_info
{
	size_t id;
	size_t n_threads;
	size_t size;
	matrix_f *in;
	matrix_f *out;
} parallel_info;

extern size_t calculate_links(const matrix_f *m, size_t row);

extern float calculate_probability(const matrix_f *m, size_t i, size_t j);

extern float calculate_probability_i(const matrix_i *adjm, const vector_i *linkv, size_t row, size_t col, const float damping_factor);

extern void gen_web_matrix(const matrix_f *m);

extern void* parallel_calculate(void* _parallel_info);

extern void gen_link_vector(vector_i *linkv, const matrix_i *adjm);

extern void gen_link_vector_crs(vector_i *linkv, int* empty, const matrix_crs_f *adjm);

extern void gen_google_matrix(matrix_f *a, matrix_f *m);

extern void gen_google_matrix_i(matrix_f *gm, matrix_i *adjm, vector_i *linkv, const float damping_factor);

extern void gen_google_matrix_crs(matrix_crs_f *m, const vector_i *linkv, const float damping_factor);

extern void matrix_solve(vector_f *v, const matrix_f *m);

extern void matrix_f_solve(vector_f *v, const matrix_f *m);

extern void page_rank(size_t size);

#endif // ALGORITHM_H

