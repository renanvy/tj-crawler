import React from "react";
import renderer from "react-test-renderer";
import Movimentations from "../index";

describe("Movimentations", () => {
  test("snapshot renders", () => {
    const component = renderer.create(<Movimentations movimentations={[]} />);
    const tree = component.toJSON();
    expect(tree).toMatchSnapshot();
  });
});
