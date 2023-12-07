                                                SELF MADE MATLAB PROJECT   OR 4 students GROUP
                                                                   
16/20 grade

Quick summary

Project carried out within the scope of the computing and Programming discipline with the objective
solving the minimum link tree(ALM) problem, using the kruskal function
Updated in the program that is requested.

Through a finite number of populations, these will be supplied with electricity, through
cables.
objective:Determine which villages receive electricity to guarantee the minimum
total length of cables.

Program called arlimin with 4 options: Load data, Perform Calculations, Show
ALM (Minimum Link Tree), Save the ALM and exit the program.

To create the program name arlimin.m , was given by the teacher the kruskal.m algorithm then the students must create another algorithm to show in the prompt the results.
I create the algorithm name resultados.m and arlimin.m program.

1-Upload Data: The program asks the user to enter a valid file name with the
distances between villages, arranged in a matrix like the following file anexo1.txt
     
2-Perform Calculations: Invocation of the Kruskal.m function to obtain the change matrix:
change = kruskal(matrix)
change =
[4 5 1;
2 8 2;
3 4 2;
5 6 2;
1 3 3;
2 4 3;
2 7 4]

-3-Show the ALM: Invocation of the results function, a function that has as parameters
input the number or town chosen by the user and also the change matrix, resulting from the
previous option.
The option to show ALM is provided in the command window, for example, if the village is chosen
number 3 or Lindoso:

4--Record the ALM: asks the user to enter the previous number or population
and save to a file with the same extension as the original file if this is your case, added to the
_ALM name

5--Exit the program: finally asks the user whether or not they want to exit the program.
In the file anexo_ALM.txt show the results for the 1st case (1st random vilagge picked was Lindoso then generate the rest of the link trees with th rest of the other towns)

References:
[1] Stormy Attaway, Matlab – A Practical Introduction to Programming and Problem Solving third
edition
