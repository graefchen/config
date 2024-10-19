# small little conventional commits helper
export def main [] {
	let type = (gum choose "fix" "feat" "docs" "style" "refactor" "test" "chore" "revert")
	mut scope = (gum input --placeholder "scope")

	if ($scope != "") {$scope = $"\(($scope)\)" }

	let summary = (gum input --value $"($type)($scope): " --placeholder "Summary of this change")
	let details = (gum write --placeholder "Details of this change")
	gum confirm "Commit changes?"
	if ($env.LAST_EXIT_CODE == 0) {
		git commit -m $"($summary)" -m $"($details)"
	}
}