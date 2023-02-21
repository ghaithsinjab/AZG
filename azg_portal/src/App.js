import { useSelector } from "react-redux";
import { Route, Routes } from "react-router-dom";

import { URL_CONFIG } from "./utils/config.utils";
import { getCurrentNav, setSEO } from "./utils/helper.utils";

import Header from "./components/layout/header/header.component";
import Footer from "./components/layout/footer/footer.component";
import Home from "./templates/home/home.template";

import { useNav } from "./hooks/nav/nav.hooks";
import { selectNav } from "./store/nav/nav.selectors";

const AppUtils = {
  /**
   * @func getRoutes Generate the react routes based on the provided list of navigation items as fetched from server
   *
   * @param {array<object>} nav the fetched navigation items
   * @param {boolean} addDefault automatically add the default routes
   * @returns {array<object>} the list of routes generated
   */
  getRoutes: (nav, addDefault = true) => {
    const routes = [];

    if (addDefault) {
      routes.push(<Route key="/" index element={<Home />} />);

      /*TODO / LANGUAGES: set routes to all possible languages */
      if (URL_CONFIG.enableLanguagePrefix)
        routes.push(<Route key="/en" path="/en" element={<Home />} />);
    }

    const newRoutes =
      nav?.reduce((acc, item) => {
        const template = item.template
          .toString()
          .toLowerCase()
          .replaceAll(" ", "-");
        const componentPath = `./templates/${template}/${template}.template`;
        const Component = require(`${componentPath}`).default;
        const ret = (
          <Route
            path={`${URL_CONFIG.enableLanguagePrefix ? "/en" : ""}${item.path}`}
            key={`${URL_CONFIG.enableLanguagePrefix ? "/en" : ""}${item.path}`}
            element={<Component />}
          />
        );

        if (item.items && item.items.length) {
          const subRoutes = AppUtils.getRoutes(item.items, false);
          acc = [...acc, ...subRoutes];
        }

        return [...acc, ret];
      }, []) || [];
    return [...routes, ...newRoutes];
  },
};

function App() {
  //load nav
  useNav();
  const nav = useSelector(selectNav);
  console.log(nav);
  const siteRoutes = AppUtils.getRoutes(nav);
  const currentNav = getCurrentNav(nav);
  currentNav && setSEO(currentNav.title);
  return (
    <div className="App clearfix" id="wrapper">
      <Header />
      <Routes>{siteRoutes}</Routes>
      <Footer />
    </div>
  );
}

export default App;
