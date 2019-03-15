%out of the total population, the new population takes the specified number
%of best individuals from previous population and rest of new population
%consisiting of children

function [ newPopulation2 ] = elitism(population , newPopulation, Er, totalfitness)

[B,n] = size(population); % number of individuals 
Elite_no = round(B * Er);

[max_val , indx] = sort(totalfitness , 'descend');
    
% The elites from the previous population
for k = 1 : Elite_no
    newPopulation2(k,:)  = population(indx(k),:);
end

% The rest from the new population
for k = Elite_no + 1 :  B
    newPopulation2(k,:)  = newPopulation(k,:);
    newPopulation2(k,:)  = newPopulation(k,:);
end

end