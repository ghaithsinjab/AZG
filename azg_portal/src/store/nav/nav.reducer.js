import { NAV_ACTION_TYPES } from "./nav.types";

const INITIAL_VALUE = {
  nav: undefined, //nav not loaded yet
};

export const navReducer = (state = INITIAL_VALUE, action = {}) => {
  const { type, payload } = action;

  switch (type) {
    case NAV_ACTION_TYPES.SET_NAV:
      return {
        ...state,
        nav: payload, //update the current nav
      };

    default:
      return state;
  }
};
