classdef t_get_named_rows < matlab.unittest.TestCase

    methods (TestClassSetup)
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)

        function t_six(testCase)
            n = 6;
            testCase.verifyEqual(get_named_rows(n, "Rounds",            true).Rounds, 1:6, "Rounds is wrong on 6.")
            testCase.verifyEqual(get_named_rows(n, "Queens",            true).Queens, [1 3 5 2 4 6], "Queens is wrong on 6.")
            testCase.verifyEqual(get_named_rows(n, "Kings",             true).Kings, [5 3 1 2 4 6], "Kings is wrong on 6.")
            testCase.verifyEqual(get_named_rows(n, "Tittums",           true).Tittums, [1 4 2 5 3 6], "Tittums is wrong on 6.")
            testCase.verifyEqual(get_named_rows(n, "ReverseTittums",    true).ReverseTittums, [3 5 2 4 1 6], "ReverseTittums is wrong on 6.")
            testCase.verifyEqual(get_named_rows(n, "BackRounds",        true).BackRounds, [5 4 3 2 1 6], "BackRounds is wrong on 6.")
            testCase.verifyEqual(get_named_rows(n, "Jacks",             true).Jacks, [1 4 5 2 3 6], "Jacks is wrong on 6.")
            testCase.verifyEqual(get_named_rows(n, "Jokers",            true).Jokers, [1 5 4 3 2 6], "Jokers is wrong on 6.")
            testCase.verifyEqual(get_named_rows(n, "SeeSaw",            true).SeeSaw, [3 2 1 4 5 6], "SeeSaw is wrong on 6.")
            testCase.verifyEqual(get_named_rows(n, "Kennet",            true).Kennet, [1 5 3 4 2 6], "Kennet is wrong on 6.")
            testCase.verifyEqual(get_named_rows(n, "Princes",           true).Princes, [5 3 2 1 4 6], "Princes is wrong on 6.")
            testCase.verifyEqual(get_named_rows(n, "ExplodingTittums",  true).ExplodingTittums, [3 4 2 5 1 6], "ExplodingTittums is wrong on 6.")
            testCase.verifyEqual(get_named_rows(n, "Burdette",          true).Burdette, [2 1 3 5 4 6], "Burdette is wrong on 6.")
            testCase.verifyEqual(get_named_rows(n, "Hagdyke",           true).Hagdyke, [3 4 1 2 5 6], "Hagdyke is wrong on 6.")
            % testCase.verifyEqual(get_named_rows(n, "ExplodingHagdyke",  true).ExplodingHagdyke, [4 3 1 2 5 6], "ExplodingHagdyke is wrong on 6.")
            testCase.verifyEqual(get_named_rows(n, "Princesses",        true).Princesses, [1 3 2 5 4 6], "Princesses is wrong on 6.")
            testCase.verifyEqual(get_named_rows(n, "Whittingtons",      true).Whittingtons, [5 3 1 2 4 6], "Whittingtons is wrong on 6.")
            testCase.verifyEqual(get_named_rows(n, "Priory",            true).Priory, [1 3 2 5 4 6], "Priory is wrong on 6.")
            testCase.verifyEqual(get_named_rows(n, "RollerCoaster",     true).RollerCoaster, [3 2 1 6 5 4], "RollerCoaster is wrong on 6.")
        end
        
        function t_eight(testCase)
            n = 8;
            testCase.verifyEqual(get_named_rows(n, "Rounds",            true).Rounds, 1:8, "Rounds is wrong on 8.")
            testCase.verifyEqual(get_named_rows(n, "Queens",            true).Queens, [1 3 5 7 2 4 6 8], "Queens is wrong on 8.")
            testCase.verifyEqual(get_named_rows(n, "Kings",             true).Kings, [7 5 3 1 2 4 6 8], "Kings is wrong on 8.")
            testCase.verifyEqual(get_named_rows(n, "Tittums",           true).Tittums, [1 5 2 6 3 7 4 8], "Tittums is wrong on 8.")
            testCase.verifyEqual(get_named_rows(n, "ReverseTittums",    true).ReverseTittums, [4 7 3 6 2 5 1 8], "ReverseTittums is wrong on 8.")
            testCase.verifyEqual(get_named_rows(n, "BackRounds",        true).BackRounds, [7 6 5 4 3 2 1 8], "BackRounds is wrong on 8.")
            testCase.verifyEqual(get_named_rows(n, "Jacks",             true).Jacks, [1 6 7 4 5 2 3 8], "Jacks is wrong on 8.")
            testCase.verifyEqual(get_named_rows(n, "Jokers",            true).Jokers, [1 7 6 5 4 3 2 8], "Jokers is wrong on 8.")
            testCase.verifyEqual(get_named_rows(n, "SeeSaw",            true).SeeSaw, [4 3 2 1 5 6 7 8], "SeeSaw is wrong on 8.")
            testCase.verifyEqual(get_named_rows(n, "Kennet",            true).Kennet, [1 5 3 7 4 2 6 8], "Kennet is wrong on 8.")
            testCase.verifyEqual(get_named_rows(n, "Princes",           true).Princes, [7 5 3 2 1 4 6 8], "Princes is wrong on 8.")
            testCase.verifyEqual(get_named_rows(n, "ExplodingTittums",  true).ExplodingTittums, [4 5 3 6 2 7 1 8], "ExplodingTittums is wrong on 8.")
            testCase.verifyEqual(get_named_rows(n, "Burdette",          true).Burdette, [3 1 2 4 7 5 6 8], "Burdette is wrong on 8.")
            testCase.verifyEqual(get_named_rows(n, "Hagdyke",           true).Hagdyke, [1 2 5 6 3 4 7 8], "Hagdyke is wrong on 8.")
            testCase.verifyEqual(get_named_rows(n, "ExplodingHagdyke",  true).ExplodingHagdyke, [4 3 5 6 2 1 7 8], "ExplodingHagdyke is wrong on 8.")
            testCase.verifyEqual(get_named_rows(n, "Princesses",        true).Princesses, [1 3 5 2 7 4 6 8], "Princesses is wrong on 8.")
            testCase.verifyEqual(get_named_rows(n, "Whittingtons",      true).Whittingtons, [1 2 7 5 3 4 6 8], "Whittingtons is wrong on 8.")
            testCase.verifyEqual(get_named_rows(n, "Priory",            true).Priory, [1 3 2 5 4 7 6 8], "Priory is wrong on 8.")
            testCase.verifyEqual(get_named_rows(n, "RollerCoaster",     true).RollerCoaster, [1 4 3 2 7 6 5 8], "RollerCoaster is wrong on 8.")
        end

        function t_ten(testCase)
            % 10 & implicitly check exclusive mode works
            names = ["Rounds", "Queens", "Kings", "Tittums", "ReverseTittums", "BackRounds", "Jacks", "Jokers", "SeeSaw", "Kennet", "Princes", "ExplodingTittums", "Burdette", "Hagdyke", "ExplodingHagdyke", "Princesses", "Whittingtons", "Priory", "RollerCoaster"];
            namedRows = arrayfun(@(x) get_named_rows(10, x, true, "Mode", "Exclusive"), names, 'Uni', 0);
            expectedResult.Rounds = 1:10;
            expectedResult.Queens = [1 3 5 7 9 2 4 6 8 10];
            expectedResult.Kings = [9 7 5 3 1 2 4 6 8 10];
            expectedResult.Tittums = [1 6 2 7 3 8 4 9 5 10];
            expectedResult.ReverseTittums = [5 9 4 8 3 7 2 6 1 10];
            expectedResult.BackRounds = [9 8 7 6 5 4 3 2 1 10];
            expectedResult.Jacks = [1 8 9 6 7 4 5 2 3 10];
            expectedResult.Jokers = [1 9 8 7 6 5 4 3 2 10];
            expectedResult.SeeSaw = [5 4 3 2 1 6 7 8 9 10];
            expectedResult.Kennet = [1 5 3 9 7 4 2 8 6 10];
            expectedResult.Princes = [9 7 5 3 2 1 4 6 8 10];
            expectedResult.ExplodingTittums = [5 6 4 7 3 8 2 9 1 10];
            expectedResult.Burdette = [3 1 2 4 5 8 6 7 9 10];
            expectedResult.Hagdyke = [3 4 1 2 7 8 5 6 9 10];
            expectedResult.ExplodingHagdyke = [4 3 1 2 8 7 5 6 9 10];
            expectedResult.Princesses = [1 3 5 7 2 9 4 6 8 10];
            expectedResult.Whittingtons = [1 2 3 4 9 7 5 6 8 10];
            expectedResult.Priory = [1 3 2 5 4 7 6 9 8 10];
            expectedResult.RollerCoaster = [3 2 1 6 5 4 9 8 7 10];
            arrayfun(@(x,y) testCase.verifyEqual(namedRows{y}.(x), expectedResult.(x), sprintf("%s is wrong on 12.", x)), names, 1:length(names))
        end

        function t_twelve(testCase)
            % 12 & implicitly check inclusive mode works
            namedRows = get_named_rows(12, "Mode", "Inclusive");
            testCase.verifyEqual(namedRows.Rounds, 1:12, "Rounds is wrong on 12.")
            testCase.verifyEqual(namedRows.Queens, [1:2:12 2:2:12], "Queens is wrong on 12.")
            testCase.verifyEqual(namedRows.Kings, [11 9 7 5 3 1 2 4 6 8 10 12], "Kings is wrong on 12.")
            testCase.verifyEqual(namedRows.Tittums, [1 7 2 8 3 9 4 10 5 11 6 12], "Tittums is wrong on 12.")
            testCase.verifyEqual(namedRows.ReverseTittums, [6 11 5 10 4 9 3 8 2 7 1 12], "ReverseTittums is wrong on 12.")
            testCase.verifyEqual(namedRows.BackRounds, [11 10 9 8 7 6 5 4 3 2 1 12], "BackRounds is wrong on 12.")
            testCase.verifyEqual(namedRows.Jacks, [1 10 11 8 9 6 7 4 5 2 3 12], "Jacks is wrong on 12.")
            testCase.verifyEqual(namedRows.Jokers, [1 11 10 9 8 7 6 5 4 3 2 12], "Jokers is wrong on 12.")
            testCase.verifyEqual(namedRows.SeeSaw, [6 5 4 3 2 1 7 8 9 10 11 12], "SeeSaw is wrong on 12.")
            % testCase.verifyEqual(namedRows.Kennet, [1 5 3 7 4 2 6 8], "Kennet is wrong on 12.")
            testCase.verifyEqual(namedRows.Princes, [11 9 7 5 3 2 1 4 6 8 10 12], "Princes is wrong on 12.")
            testCase.verifyEqual(namedRows.ExplodingTittums, [6 7 5 8 4 9 3 10 2 11 1 12], "ExplodingTittums is wrong on 12.")
            testCase.verifyEqual(namedRows.Burdette, [2 1 3 5 4 6 8 7 9 11 10 12], "Burdette is wrong on 12.")
            testCase.verifyEqual(namedRows.Hagdyke, [1 2 5 6 3 4 9 10 7 8 11 12], "Hagdyke is wrong on 12.")
            % testCase.verifyEqual(namedRows.ExplodingHagdyke, [7 8 10 9 3 4 6 5 1 2 11 12], "ExplodingHagdyke is wrong on 12.")
            testCase.verifyEqual(namedRows.Princesses, [1 3 5 7 9 2 11 4 6 8 10 12], "Princesses is wrong on 12.")
            testCase.verifyEqual(namedRows.Whittingtons, [5 3 1 2 4 6 11 9 7 8 10 12], "Whittingtons is wrong on 12.")
            testCase.verifyEqual(namedRows.Priory, [1 3 2 5 4 7 6 9 8 11 10 12], "Priory is wrong on 12.")
            testCase.verifyEqual(namedRows.RollerCoaster, [3 2 1 6 5 4 9 8 7 12 11 10], "RollerCoaster is wrong on 12.")
        end

    end
end