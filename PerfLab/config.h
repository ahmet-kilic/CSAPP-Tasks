/*********************************************************
 * config.h - Configuration data for the driver.c program.
 *********************************************************/
#ifndef _CONFIG_H_
#define _CONFIG_H_

/* 
 * CPEs for the baseline (naive) version of the bokeh function that
 * was handed out to the students. Rd is the measured CPE for a dxd
 * image. Run the driver.c program on your system to get these
 * numbers.  
 */
#define B32    67.9
#define B64    68.2
#define B128   70.1
#define B256   70.9
#define B512   72

/* 
 * CPEs for the baseline (naive) version of the smooth function that
 * was handed out to the students. Sd is the measure CPE for a dxd
 * image. Run the driver.c program on your system to get these
 * numbers.  
 */
#define H64   	1.5
#define H128  	1.5
#define H256  	1.5
#define H512  	1.5
#define H1024 	1.8

#endif /* _CONFIG_H_ */
