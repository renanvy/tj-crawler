import React from "react";
import renderer from "react-test-renderer";
import Preloader from "../index";

describe("Preloader", () => {
  test("snapshot renders", () => {
    const component = renderer.create(<Preloader />);

    const tree = component.toJSON();
    expect(tree).toMatchSnapshot();
  });
});
