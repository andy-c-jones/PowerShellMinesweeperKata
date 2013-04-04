$here = Split-Path -Parent $MyInvocation.MyCommand.Path
. $here/Minesweeper.ps1

Describe -Tags "" "When CreateGrid with 4 rows, 4 columns and *........*......" {

	$input = "*........*......";

	$output = CreateGrid 4 4 $input

	It "creates the correct output" {
		$output.Should.Be("*10022101*101110");
	}
}

Describe -Tags "" "When CreateGrid with 3 rows, 5 columns and **.........*..." {

	$input = "**.........*...";

	$output = CreateGrid 3 5 $input

	It "creates the correct output" {
		$output.Should.Be("**100332001*100");
	}
}
