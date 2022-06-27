Notes on Vasculopathy Files for Github
--------------------------------------

27 June 2022

1.  The overall method that I followed for this work is described in the 'Vasculopathy_Analysis_v2.docx' document.  The document refers to moving files back and forth between a laptop running Windows 10 and the Unix environment on the University HPC facility (CSD3).  This is how I did the work initially - the Unix, text-editing and Perl steps were done on CSD3 and the output files transferred back to my laptop for Excel work.

2.  The Perl scripts have been modified so that they will run on a Windows PC if you want to try them out.  I now do this using the 'Git Bash' application, which provides a Unix-type environment for Windows. The input files have been provided and there is also a sample output file.

3.  For the sake of clarity, I have only included the immediate input and output files for each of the scripts.  All the intermediate text-processing files referred to in the 'methods' document are in separate 'Intermediate_Files' folders.  They're there for reference only and are not needed to run the scripts.  There is also an example of the final output Excel file for each of the scripts.

4.  The 'methods' file refers to some intermediate steps which aren't repeated here, eg. converting *.xlsx files to *.csv files, and so on.  I thought it would just confuse matters to include every single step and intermediate file.