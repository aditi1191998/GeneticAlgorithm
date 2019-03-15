%Roulette wheel selection operator

function [parent1, parent2] = selection(population,totalfitness)

%M = length(population.Chromosomes(:));
[A,N] = size(population);
normalized_fitness = totalfitness ./ sum(totalfitness);
[sorted_fitness_values , sorted_idx] = sort(normalized_fitness , 'descend');
for i = 1 : A
    temp_population(i,:) = population(sorted_idx(i),:);
    temp_fitness(i,:) = totalfitness(sorted_idx(i));
    temp_normalized_fitness(i,:) = normalized_fitness(sorted_idx(i));
end


cumsum = zeros(1 , A);

for i = 1 : A
    for j = i : A
        cumsum(i) = cumsum(i) + temp_normalized_fitness(j);
    end
end


R = rand(); % in [0,1]
parent1_idx = A;
for i = 1: length(cumsum)
    if R > cumsum(i)
        parent1_idx = i - 1;
        break;
    end
end

parent2_idx = parent1_idx;
while_loop_stop = 0; % to break the while loop in rare cases where we keep getting the same index
while parent2_idx == parent1_idx
    while_loop_stop = while_loop_stop + 1;
    R = rand(); % in [0,1]
    if while_loop_stop > 20
        break;
    end
    for i = 1: length(cumsum)
        if R > cumsum(i)
            parent2_idx = i - 1;
            break;
        end
    end
end

parent1 = temp_population(parent1_idx,:);
parent2 = temp_population(parent2_idx,:);

end