classdef test_cases_1c < matlab.unittest.TestCase
    methods(Test)
        function cocktail(testCase)
            % As seen in tutorial.
            m = 3;
            n = 5;
            
            A = [0.08 0.06 1 0 0;
                 1 0 0 1 0;
                 0 1 0 0 1];
            
            c = [-2 -1.25 0 0 0]';
            
            b = [12 120 120]';
            
            [z,x,pi,ind,exitflag] = rsm(A,b,c,m,n);

            testCase.verifyEqual(z,-290, RelTol = 1e-5);
            testCase.verifyEqual(x,[40,120,80].', RelTol = 1e-5);
            testCase.verifyEqual(pi,[-125/6, -1/3, 0].', RelTol = 1e-5);
            testCase.verifyEqual(ind,[2,1,5].', RelTol = 1e-5);
            testCase.verifyEqual(exitflag,0, RelTol = 1e-5);
        end

        function cocktail_unbounded(testCase)
            % Unbounded cocktail problem as seem in tutorial
            m = 3;
            n = 5;
            
            A = [0.08 0.06 -1 0 0;
                 1 0 0 -1 0;
                 0 1 0 0 -1];
            
            c = [-2 -1.25 0 0 0]';
            
            b = [12 120 120]';

            [z,x,pi,ind,exitflag] = rsm(A,b,c,m,n);
            
            % Don't think we need all return values to be exact here as
            % long as exitflag = -1. But why not...
%             testCase.verifyEqual(z,0, RelTol = 1e-5);
%             testCase.verifyEqual(x,[-12,-120,-120].', RelTol = 1e-5);
%             testCase.verifyEqual(pi,[0, 0, 0].', RelTol = 1e-5);
%             testCase.verifyEqual(ind,[3,4,5].', RelTol = 1e-5);
            testCase.verifyEqual(exitflag,-1, RelTol = 1e-5);
        end

        function another_cocktail_unbounded(testCase)
            % Unbounded cocktail problem as seem in tutorial
            m = 3;
            n = 5;
            
            A = [0.08 0.06 -1 0 0;
                 1 0 0 -1 0;
                 0 1 0 0 -1];
            
            c = [-2 -1.25 0 0 0]';
            
            b = [12 60 60]';

            [z,x,pi,ind,exitflag] = rsm(A,b,c,m,n);
            
            % Don't think we need all return values to be exact here as
            % long as exitflag = -1. But why not...
            testCase.verifyEqual(exitflag,-1, AbsTol = 1e-5);
        end

        function Assignment_1_Q3(testCase)
            m = 3;
            n = 6;
            
            A = [1 1 1 1 0 0;
                 1 2 2 -1 1 0;
                 1 2 1 0 -1 1];
            
            c = [15 10 -10 1 2 3]';
            
            b = [4 4 4]';

            [z,x,pi,ind,exitflag] = rsm(A,b,c,m,n);
            
            testCase.verifyEqual(z,-64/3, RelTol = 1e-5);
            testCase.verifyEqual(x,[8/3,4/3,4/3].', RelTol = 1e-5);
            testCase.verifyEqual(pi,[-11/3, -14/3, 3].', RelTol = 1e-5);
            testCase.verifyEqual(ind,[3,6,4].', RelTol = 1e-5);
            testCase.verifyEqual(exitflag,0, RelTol = 1e-5);
        end

        function Assignment_1_Q4(testCase)
            m = 2;
            n = 5;
            
            A = [1 2 3 1 -1;
                 2 1 4 -1 2];
            
            c = [1 1 1 1 1]';
            
            b = [4 6]';

            [z,x,pi,ind,exitflag] = rsm(A,b,c,m,n);

            testCase.verifyEqual(z,8/5, RelTol = 1e-5);
            testCase.verifyEqual(x,[7/5,1/5].', RelTol = 1e-5);
            testCase.verifyEqual(pi,[-1/5,2/5].', RelTol = 1e-5);
            testCase.verifyEqual(ind,[3,5].', RelTol = 1e-5);
            testCase.verifyEqual(exitflag,0, RelTol = 1e-5);
        end

        function Assignment_1_Q4_redundant_constraint(testCase)
            m = 3;
            n = 5;
            
            A = [1 2 3 1 -1;
                 2 1 4 -1 2;
                 2 1 4 -1 2];
            
            c = [1 1 1 1 1]';
            
            b = [4 6 6]';

                [z,x,pi,ind,exitflag] = rsm(A,b,c,m,n);

            testCase.verifyEqual(z,8/5, RelTol = 1e-5);
%             testCase.verifyEqual(x,[7/5,1/5].', RelTol = 1e-5);
%             testCase.verifyEqual(pi,[-1/5,2/5].', RelTol = 1e-5);
%             testCase.verifyEqual(ind,[3,5].', RelTol = 1e-5);
            testCase.verifyEqual(exitflag,0, RelTol = 1e-5);
        end

        function Assignment_1_Q4_redundant_constraint_2(testCase)
            m = 3;
            n = 5;
            
            A = [1 2 3 1 -1;
                 2 1 4 -1 2;
                 1 2 1 1 -2];
            
            c = [1 1 1 1 1]';
            
            b = [4 6 1]';

                [z,x,pi,ind,exitflag] = rsm(A,b,c,m,n);

            testCase.verifyEqual(z,8/5, RelTol = 1e-5);
%             testCase.verifyEqual(x,[7/5,1/5].', RelTol = 1e-5);
%             testCase.verifyEqual(pi,[-1/5,2/5].', RelTol = 1e-5);
%             testCase.verifyEqual(ind,[3,5].', RelTol = 1e-5);
            testCase.verifyEqual(exitflag,0, RelTol = 1e-5);
        end

        function Degen(testCase)
             % Idk if this is right... from slides...
 
            m = 3;
            n = 5;
            
            A = [0.08 0.06 1 0 0;
                 1 0 0 1 0;
                 0 1 0 0 1];
            
            c = [-7 -6 0 0 0]';
            
            b = [10 125 120]';
            
            [z,x,pi,ind,exitflag] = rsm(A,b,c,m,n);
            
            % Don't think we need all return values to be exact here as
            % long as exitflag = -1. But why not...
            testCase.verifyEqual(z,-965, RelTol = 1e-5);
            testCase.verifyEqual(x,[35,90,120].', RelTol = 1e-5);
            testCase.verifyEqual(pi,[-87.5, 0, -0.75].', RelTol = 1e-5);
            testCase.verifyEqual(ind,[1, 4, 2].', RelTol = 1e-5);
            testCase.verifyEqual(exitflag,0, RelTol = 1e-5);
        end

         function Assignment_1_Q5(testCase)
             % problem from assignment
             m = 2;
             n = 5;
 
             A = [1 2 3 1 -1;
                 2 1 4 -1 2];
 
             b = [4 6].';
 
             c = [1 1 1 1 1].';
 
             [z,x,pi,ind,exitflag] = rsm(A,b,c,m,n);
 
             testCase.verifyEqual(z,1.6, RelTol = 1e-5);
             testCase.verifyEqual(exitflag,0, RelTol = 1e-5);
         end

         function Tutorial_2_Q1(testCase)
             % problem from tut
             m = 4;
             n = 6;
 
             A = [2 4 1 0 0 0;
                 4 4 0 1 0 0;
                 6 3 0 0 1 0;
                 -4 3 0 0 0 1];
 
             b = [16 20 24 6].';
 
             c = [-3 -2 0 0 0 0].';
 
             [z,x,pi,ind,exitflag] = rsm(A,b,c,m,n);
 
             testCase.verifyEqual(z,-13, RelTol = 1e-5);
             testCase.verifyEqual(x,[3,12,2,2].', RelTol = 1e-5);
             testCase.verifyEqual(pi,[0,-0.25,-1/3,0].', RelTol = 1e-5);
             testCase.verifyEqual(ind,[1,6,3,2].', RelTol = 1e-5);
             testCase.verifyEqual(exitflag,0, RelTol = 1e-5);
         end


        function Tutorial_2_Q2(testCase)
             % problem from tut
             m = 3;
             n = 6;
 
             A = [1 1 1 1 0 0;
                 0 1 0 -1 1 0;
                 1 0 -1 0 -1 1];
 
             b = [4 4 4].';
 
             c = [15 10 -10 1 2 3].';
 
             [z,x,pi,ind,exitflag] = rsm(A,b,c,m,n);
 
             testCase.verifyEqual(z,4, RelTol = 1e-5);
             testCase.verifyEqual(x,[4,4,12].', RelTol = 1e-5);
             testCase.verifyEqual(pi,[-7,5,3].', RelTol = 1e-5);
             testCase.verifyEqual(ind,[3,5,6].', RelTol = 1e-5);
             testCase.verifyEqual(exitflag,0, RelTol = 1e-5);
         end

         function Assignment_1_Q5_Primal(testCase)
             % Primal problem from assignment adjusted to have equality
             % constraints.
             % This one may not be possible to solve wihtout
             % something fancy like bland's rule or pertubing RHS (which
             % Andy has said we don't need). 
             % On the other hand the test may just be wrong.
             % I get -1.5 as my optimal value.
             %
             % Supposed optimal x values in order:
             % [-0.2 0.4 0.4 1 0 1.6 0]

             % Not passing this (Nikhil + Nene)

            m = 5;
            n = 7;

            A = [1 2;
                 2 1;
                 3 4;
                 1 -1;
                 -1 2];

            A = [A eye(5)];

            b = ones(5,1);

            c = [-4 -6 0 0 0 0 0].';

            [z,x,pi,ind,exitflag] = rsm(A,b,c,m,n);
 
             testCase.verifyEqual(z,-1.6, RelTol = 1e-5);
             testCase.verifyEqual(exitflag,0, RelTol = 1e-5);
         end
    end
end
