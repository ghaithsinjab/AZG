import { NAV_ACTION_TYPES } from "./nav.types";
import { createAction } from "../../utils/reducers.utils";

export const setNav = (nav) => createAction(NAV_ACTION_TYPES.SET_NAV, nav);
