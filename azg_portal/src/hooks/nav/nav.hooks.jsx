/**
 * the collection of hooks for nav items
 *
 * author: Ghaith Sinjab
 * created: 10/2/2023 @ 17:08
 */
import { useCallback, useEffect, useState } from "react";
import { useDispatch } from "react-redux";

import { httpGetNav } from "./nav.requests";

import { setNav } from "../../store/nav/nav.actions";

/**
 * @function useNav a hook to fetch main navigation
 */
export const useNav = () => {
  const dispatch = useDispatch();

  const getNav = useCallback(async () => {
    const nav = await httpGetNav();
    dispatch(setNav(nav));
  }, [dispatch]);

  useEffect(() => {
    getNav();
  }, [getNav]);
};

export const useOtherNav = (direction) => {
  const [nav, setNav] = useState([]);

  const getNav = useCallback(async (direction) => {
    const fetched = await httpGetNav(direction, true);
    setNav(fetched);
  }, []);

  useEffect(() => {
    getNav(direction);
  }, [getNav, direction]);

  return nav;
};