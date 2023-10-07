classdef tSupportingFunctions < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)
        % Test methods
        function t_flipudc(testCase)
            testCase.verifyEqual(flipudc([1 2; 3 4; 5 6], 2), [1 6; 3 4; 5 2], "Output should be equal.")
        end
    end

end