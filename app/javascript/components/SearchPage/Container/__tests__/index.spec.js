import React from "react";
import renderer from "react-test-renderer";
import Container from "../index";

describe("Container", () => {
  test("snapshot renders", () => {
    const component = renderer.create(
      <Container loading search={() => {}}>
        Foo
      </Container>
    );
    const tree = component.toJSON();
    expect(tree).toMatchSnapshot();
  });
});
