import React from "react";
import renderer from "react-test-renderer";
import SearchPage from "../index";
import "materialize-css/dist/js/materialize.min";

describe("SearchPage", () => {
  test("snapshot renders", () => {
    const component = renderer.create(<SearchPage />);

    const tree = component.toJSON();
    expect(tree).toMatchSnapshot();
  });
});
