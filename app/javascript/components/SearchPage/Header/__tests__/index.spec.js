import React from "react";
import renderer from "react-test-renderer";
import Header from "../index";
import "materialize-css/dist/js/materialize.min";

describe("Header", () => {
  test("snapshot renders", () => {
    const component = renderer.create(<Header loading search={() => {}} />);
    const tree = component.toJSON();
    expect(tree).toMatchSnapshot();
  });
});
