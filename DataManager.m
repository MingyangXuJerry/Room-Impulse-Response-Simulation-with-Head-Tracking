classdef DataManager < handle

    properties
        room_dimensions
        receiver_coords
        source_coords
        wall_materials
        fs
        HRTF_dataset_file
        h_table
    end

    methods
        function obj = DataManager(varargin)
            if nargin == 0
                obj.room_dimensions = [0, 0, 0];
                obj.receiver_coords = [0, 0, 0];
                obj.source_coords = [0, 0, 0];
                obj.wall_materials = cell(1,6);
                obj.fs = 12000;
                obj.HRTF_dataset_file = "ReferenceHRTF.mat";
                obj.h_table = table();
            else
                obj.room_dimensions = varargin{1};
                obj.receiver_coords = varargin{2};
                obj.source_coords = varargin{3};
                obj.wall_materials = varargin{4};
                obj.fs = varargin{5};
                obj.HRTF_dataset_file = varargin{6};
                obj.h_table = varargin{7};
            end
        end

        function writeToFile(obj, filename)
            % Open the text file for writing
            fid = fopen(filename, 'w');

            % Write the room_dimensions array to the file
            fprintf(fid, 'room_dimensions\n');
            fprintf(fid, '%f\t', obj.room_dimensions);
            fprintf(fid, '\n\n');

            % Write the receiver_coords array to the file
            fprintf(fid, 'receiver_coords\n');
            fprintf(fid, '%f\t', obj.receiver_coords);
            fprintf(fid, '\n\n');

            % Write the source_coords array to the file
            fprintf(fid, 'source_coords\n');
            fprintf(fid, '%f\t', obj.source_coords);
            fprintf(fid, '\n\n');

            % Write the wall_materials array to the file
            fprintf(fid, 'wall_materials\n');
            for i = 1:length(obj.wall_materials)
                fprintf(fid, '%s\t', obj.wall_materials{i});
            end
            fprintf(fid, '\n\n');

            % Write the fs to the file
            fprintf(fid, 'sampling_frequency\n');
            fprintf(fid, '%f\t', obj.fs);
            fprintf(fid, '\n\n');

            % Write the hrtfData_file to the file
            fprintf(fid, 'hrtfData_file\n');
            fprintf(fid, '%s\t', obj.HRTF_dataset_file);
            fprintf(fid, '\n\n');

            % Write the h_table table to the file
            fprintf(fid, 'h_table\n');
            for i = 1:height(obj.h_table)
                for j = 1:width(obj.h_table)
                    fprintf(fid, '%f\t', obj.h_table{i,j});
                end
                fprintf(fid, '\n');
            end

            % Close the text file
            fclose(fid);
        end
        
        function readFromFile(obj, filename)
            % Open the text file for reading
            fid = fopen(filename, 'r');

            % Read the room_dimensions array from the file
            fscanf(fid, '%s', [1, 1]);
            fgetl(fid);
            obj.room_dimensions = fscanf(fid, '%f', [1, 3]);
            fgetl(fid);

            % Read the receiver_coords array from the file
            fscanf(fid, '%s', [1, 1]);
            fgetl(fid);
            obj.receiver_coords = fscanf(fid, '%f', [1, 3]);
            fgetl(fid);

            % Read the source_coords array from the file
            fscanf(fid, '%s', [1, 1]);
            fgetl(fid);
            obj.source_coords = fscanf(fid, '%f', [1, 3]);
            fgetl(fid);

            % Read the wall_materials array from the file
            fscanf(fid, '%s', [1, 1]);
            fgetl(fid);
            obj.wall_materials = textscan(fgetl(fid), '%s', 'Delimiter', '\t');

            % Read the fs from the file
            fscanf(fid, '%s', [1, 1]);
            fgetl(fid);
            obj.fs = fscanf(fid, '%f', [1, 1]);
            fgetl(fid);

            % Read the hrtfData_file from the file
            fscanf(fid, '%s', [1, 1]);
            fgetl(fid);
            obj.HRTF_dataset_file = fscanf(fid, '%s', [1, 1]);
            fgetl(fid);

            % Read the h_table table from the file
            fscanf(fid, '%s', [1, 1]);
            fgetl(fid);
            h_data = textscan(fid, '%f%f', 'Delimiter', '\t');
            obj.h_table = table(h_data{1}, h_data{2}, 'VariableNames', {'Var1', 'Var2'});

            % Close the text file
            fclose(fid);
        end

        function show(obj)
            fprintf('Printing saved data...\n\n');
            % Write the room_dimensions array to the file
            fprintf('room_dimensions\n');
            fprintf('%.2f\t', obj.room_dimensions);
            fprintf('\n\n');

            % Write the receiver_coords array to the file
            fprintf('receiver_coords\n');
            fprintf('%.2f\t', obj.receiver_coords);
            fprintf('\n\n');

            % Write the source_coords array to the file
            fprintf('source_coords\n');
            fprintf('%.2f\t', obj.source_coords);
            fprintf('\n\n');

            % Write the wall_materials array to the file
            fprintf('wall_materials (floor, front, left, back, right, ceiling)\n');
            for i = 1:length(obj.wall_materials{1})
                fprintf('%s\t', obj.wall_materials{1}{i});
            end
            fprintf('\n\n');

            % Write the fs to the file
            fprintf('sampling_frequency\n');
            fprintf('%f\t', obj.fs);
            fprintf('\n\n');

            % Write the hrtfData_file to the file
            fprintf('HRTF_dataset_file\n');
            fprintf('%s\t', obj.HRTF_dataset_file);
        end
    end
end
