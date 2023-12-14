% absorption coeffients source: https://www.acoustic-supplies.com/absorption-coefficient-chart/
classdef WallMaterialAbsorptionCoefficients
    properties
        freqs = [125, 250, 500, 1000, 2000, 4000]% Frequency bands in Hz
        abs_coeffs % Absorption coefficients
        material
    end
    
    methods
        function obj = WallMaterialAbsorptionCoefficients(material)
            switch material
                case 'wood'
                    obj.abs_coeffs = [0.15, 0.11, 0.1, 0.07, 0.06, 0.07];
                case 'concrete'
                    obj.abs_coeffs = [0.01, 0.02, 0.04, 0.06, 0.08, 0.1];
                case 'glass'
                    obj.abs_coeffs = [0.18, 0.06, 0.04, 0.03, 0.02, 0.02];
                case 'plaster'
                    obj.abs_coeffs = [0.29, 0.1, 0.06, 0.05, 0.04, 0.04];
                case 'fiberglass'
                    obj.abs_coeffs = [0.18, 0.76, 0.99, 0.99, 0.99, 0.99];
                case 'ice'
                    obj.abs_coeffs = [0.008, 0.008, 0.013, 0.015, 0.02, 0.025];
                otherwise
                    obj.abs_coeffs = [0, 0, 0, 0, 0, 0];
            end
            obj.material = material;
        end
    end
end