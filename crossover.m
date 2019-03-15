%single and double point crossover code 

function [child1 , child2] = crossover(parent1 , parent2, crossoverName)

switch crossoverName
    case 'single'
        [x,Gene_no] = size(parent1);
        ub = Gene_no - 1;
        lb = 1;
        Cross_P = round (  (ub - lb) *rand() + lb  );
        
        Part1 = parent1(1,1:Cross_P);
        Part2 = parent2(1,Cross_P + 1 : Gene_no);
        child1 = [Part1, Part2];
        
        Part1 = parent2(1,1:Cross_P);
        Part2 = parent1(1,Cross_P + 1 : Gene_no);
        child2 = [Part1, Part2];
        
        
    case 'double'
        Gene_no = size(parent1);
       
        ub = size(parent1) - 1;
        lb = 1;
        Cross_P1 = round (  (ub - lb) *rand() + lb  );
        
        Cross_P2 = Cross_P1;
        
        while Cross_P2 == Cross_P1
            Cross_P2 = round (  (ub - lb) *rand() + lb  );
        end
        
        if Cross_P1 > Cross_P2
            temp =  Cross_P1;
            Cross_P1 =  Cross_P2;
            Cross_P2 = temp;
        end

        Part1 = parent1(1,1:Cross_P1);
        Part2 = parent2(1,Cross_P1 + 1 :Cross_P2);
        Part3 = parent1(1,Cross_P2+1:end);
        
        child1 = [Part1 , Part2 , Part3];
        
        
        Part1 = parent2(1,1:Cross_P1);
        Part2 = parent1(1,Cross_P1 + 1 :Cross_P2);
        Part3 = parent2(1,Cross_P2+1:end);
        
        child2 = [Part1 , Part2 , Part3];
end

R1 = rand();

%{
if R1 <= Pc
  child1 = child1;
else
    child1 = parent1;
end

R2 = rand();

if R2 <= Pc
    child2 = child2;
else
    child2 = parent2;
end
%}

end