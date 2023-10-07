classdef t_get_named_rows < matlab.unittest.TestCase

    properties (TestParameter)
        bell = struct("six", 6, "eight", 8, "ten", 10, "twelve", 12);
    end

    methods (TestClassSetup)
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)

        function testNumElements(testCase, bell)
            testCase.verifyNumElements(get_named_rows(bell, "Rounds", true).Rounds, bell)
        end

        function testOutput(testCase, bell)

            switch bell
                case 6
                    expected = struct("Rounds", [1 2 3 4 5 6],...
                        "Queens", [1 3 5 2 4 6],...
                        "Kings", [5 3 1 2 4 6],...
                        "Tittums", [1 4 2 5 3 6],...
                        "ReverseTittums", [3 5 2 4 1 6],...
                        "BackRounds", [5 4 3 2 1 6],...
                        "Jacks", [1 4 5 2 3 6],...
                        "Jokers", [1 5 4 3 2 6],...
                        "SeeSaw", [3 2 1 4 5 6],...
                        "Kennet", [1 5 3 4 2 6],...
                        "Princes", [5 3 2 1 4 6],...
                        "ExplodingTittums", [3 4 2 5 1 6],...
                        "Burdette", [2 1 3 5 4 6],...
                        "Hagdyke", [3 4 1 2 5 6],...
                        "ExplodingHagdyke", [],...
                        "Princesses", [1 3 2 5 4 6],...
                        "Whittingtons", [5 3 1 2 4 6],...
                        "Priory", [1 3 2 5 4 6],...
                        "RollerCoaster", [3 2 1 6 5 4]);
                case 8
                    expected = struct("Rounds", [1 2 3 4 5 6 7 8],...
                        "Queens", [1 3 5 7 2 4 6 8],...
                        "Kings", [7 5 3 1 2 4 6 8],...
                        "Tittums", [1 5 2 6 3 7 4 8],...
                        "ReverseTittums", [4 7 3 6 2 5 1 8],...
                        "BackRounds", [7 6 5 4 3 2 1 8],...
                        "Jacks", [1 6 7 4 5 2 3 8],...
                        "Jokers", [1 7 6 5 4 3 2 8],...
                        "SeeSaw", [4 3 2 1 5 6 7 8],...
                        "Kennet", [1 5 3 7 4 2 6 8],...
                        "Princes", [7 5 3 2 1 4 6 8],...
                        "ExplodingTittums", [4 5 3 6 2 7 1 8],...
                        "Burdette", [3 1 2 4 7 5 6 8],...
                        "Hagdyke", [1 2 5 6 3 4 7 8],...
                        "ExplodingHagdyke", [4 3 5 6 2 1 7 8],...
                        "Princesses", [1 3 5 2 7 4 6 8],...
                        "Whittingtons", [1 2 7 5 3 4 6 8],...
                        "Priory", [1 3 2 5 4 7 6 8],...
                        "RollerCoaster", [1 4 3 2 7 6 5 8]);
                case 10
                    expected = struct("Rounds", [1 2 3 4 5 6 7 8 9 10],...
                        "Queens", [1 3 5 7 9 2 4 6 8 10],...
                        "Kings", [9 7 5 3 1 2 4 6 8 10],...
                        "Tittums", [1 6 2 7 3 8 4 9 5 10],...
                        "ReverseTittums", [5 9 4 8 3 7 2 6 1 10],...
                        "BackRounds", [9 8 7 6 5 4 3 2 1 10],...
                        "Jacks", [1 8 9 6 7 4 5 2 3 10],...
                        "Jokers", [1 9 8 7 6 5 4 3 2 10],...
                        "SeeSaw", [5 4 3 2 1 6 7 8 9 10],...
                        "Kennet", [1 5 3 9 7 4 2 8 6 10],...
                        "Princes", [9 7 5 3 2 1 4 6 8 10],...
                        "ExplodingTittums", [5 6 4 7 3 8 2 9 1 10],...
                        "Burdette", [3 1 2 4 5 8 6 7 9 10],...
                        "Hagdyke", [3 4 1 2 7 8 5 6 9 10],...
                        "ExplodingHagdyke", [],...
                        "Princesses", [1 3 5 7 2 9 4 6 8 10],...
                        "Whittingtons", [1 2 3 4 9 7 5 6 8 10],...
                        "Priory", [1 3 2 5 4 7 6 9 8 10],...
                        "RollerCoaster", [3 2 1 6 5 4 9 8 7 10]);
                case 12
                    expected = struct("Rounds", [1 2 3 4 5 6 7 8 9 10 11 12],...
                        "Queens", [1 3 5 7 9 11 2 4 6 8 10 12],...
                        "Kings", [11 9 7 5 3 1 2 4 6 8 10 12],...
                        "Tittums", [1 7 2 8 3 9 4 10 5 11 6 12],...
                        "ReverseTittums", [6 11 5 10 4 9 3 8 2 7 1 12],...
                        "BackRounds", [11 10 9 8 7 6 5 4 3 2 1 12],...
                        "Jacks", [1 10 11 8 9 6 7 4 5 2 3 12],...
                        "Jokers", [1 11 10 9 8 7 6 5 4 3 2 12],...
                        "SeeSaw", [6 5 4 3 2 1 7 8 9 10 11 12],...
                        "Kennet", [],...
                        "Princes", [11 9 7 5 3 2 1 4 6 8 10 12],...
                        "ExplodingTittums", [6 7 5 8 4 9 3 10 2 11 1 12],...
                        "Burdette", [2 1 3 5 4 6 8 7 9 11 10 12],...
                        "Hagdyke", [1 2 5 6 3 4 9 10 7 8 11 12],...
                        "ExplodingHagdyke", [],...
                        "Princesses", [1 3 5 7 9 2 11 4 6 8 10 12],...
                        "Whittingtons", [5 3 1 2 4 6 11 9 7 8 10 12],...
                        "Priory", [1 3 2 5 4 7 6 9 8 11 10 12],...
                        "RollerCoaster", [3 2 1 6 5 4 9 8 7 12 11 12]);
            end

            rows = get_named_rows(bell, "Mode", "Inclusive");
            cellfun(@(x) testCase.verifyEqual(rows.(x), expected.(x)), fieldnames(expected))

        end

    end
end