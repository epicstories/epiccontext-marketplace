# Graph-vs-design drift — step 7

The graph is the contract; the design is one rendering of it. Compare
them both ways:

- **In the graph, not in the design**: a `component_spec` or
  `content_page` section that the screen should carry and doesn't (the
  Yellowbello home was missing its specified `folder-teaser`); copy that
  differs from the `content_page`; a recorded style direction the screen
  ignores.
- **In the design, not in the graph**: a component with no spec; a token
  value not in the fundamentals; a flow step with no journey entry.

Drift is reported as its own short table and lands either as a design
change or as a graph update — never left as a difference.
`npx @google/design.md diff` does this for tokens when a DESIGN.md
export exists; `check_project_health` catches the spec side.
