import React from "react";
import renderer from "react-test-renderer";
import Details from "../index";

describe("Details", () => {
  test("snapshot renders", () => {
    const process = { number: "1234" };

    const component = renderer.create(<Details process={process} />);
    const tree = component.toJSON();
    expect(tree).toMatchSnapshot();
  });
});
