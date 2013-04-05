$here = Split-Path -Parent $MyInvocation.MyCommand.Path
. "$here/Minesweeper.ps1"

Describe -Tags "" "When CreateGrid with 4 rows, 4 columns and *........*......" {

	$mineLocations = "*........*......";

	$output = CreateGrid 4 4 $mineLocations

	It "creates the correct output" {
		$output | Should Be $("*10022101*101110");
	}
}

Describe -Tags "" "When CreateGrid with 3 rows, 5 columns and **.........*..." {

	$mineLocations = "**.........*...";

	$output = CreateGrid 3 5 $mineLocations

	It "creates the correct output" {
		$output | Should Be $("**100332001*100");
	}
}

Describe -Tags "" "When a 1 by 1 grid input is a mine, that location in the grid is a mine" {

	$mineLocations = "*";
	
	$output = CreateGrid 1 1 $mineLocations
	
	It "creates the correct output" {
		$output | Should Be $("*");
	}
}

Describe -Tags "" "When a 1 by 1 grid input is not a mine, that location in the output grid is not a mine" {

	$mineLocations = ".";
	
	$output = CreateGrid 1 1 $mineLocations
	
	It "creates the correct output" {
		$output | Should Be $("0");
	}
}

Describe -Tags "" "When a 1 by 2 grid input is not a mine, that location in the output grid is not a mine" {

	$mineLocations = "*.";
	
	$output = CreateGrid 1 2 $mineLocations
	
	It "creates the correct output" {
		$output | Should Be $("*1");
	}
}

Describe -Tags "" "When a 1 by 3 grid input is not a mine, that location in the output grid is not a mine" {

	$mineLocations = ".*.";
	
	$output = CreateGrid 1 3 $mineLocations
	
	It "creates the correct output" {
		$output | Should Be $("1*1");
	}
}

Describe -Tags "" "When a 1 by 3 grid input is not a mine, that location in the output grid is not a mine" {

	$mineLocations = ".*.*";
	
	$output = CreateGrid 1 4 $mineLocations
	
	It "creates the correct output" {
		$output | Should Be $("1*2*");
	}
}