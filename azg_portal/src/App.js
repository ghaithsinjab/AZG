import { useSelector } from "react-redux";
import { Route, Routes } from "react-router-dom";
import { ToastContainer } from "react-toastify";
import { lazy, useEffect, Suspense } from "react";

import { URL_CONFIG } from "./utils/config.utils";
import { getCurrentNav, setSEO } from "./utils/helper.utils";

import Header from "./components/layout/header/header.component";
import Footer from "./components/layout/footer/footer.component";

import { useNav } from "./hooks/nav/nav.hooks";
import { selectNav } from "./store/nav/nav.selectors";

const Home = lazy(() => import("./templates/home/home.template"));
const Search = lazy(() => import("./templates/search/search.template"));

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
        const componentPath = `./templates/${template}/${template}.template.jsx`;
        const Component = lazy(() => import(`${componentPath}`));
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
  const siteRoutes = AppUtils.getRoutes(nav);
  const currentNav = getCurrentNav(nav);
  currentNav && setSEO(currentNav.title);

  //adjust body height
  const adjustHeight = () => {
    const elements = {
      windowHeight: window.innerHeight,
      header: document.getElementsByTagName("header")[0],
      footer: document.getElementsByTagName("footer")[0],
      targetElement: document.getElementsByClassName("body-content")[0],
    };
    const minHeight = elements.windowHeight - elements.footer.clientHeight - 6;
    elements.targetElement.style.minHeight = `${minHeight}px`;
  };

  useEffect(() => {
    adjustHeight();
  }, []);

  return (
    <div className="App">
      <div className="clearfix" id="wrapper">
        <ToastContainer
          position="top-center"
          autoClose={5000}
          theme="colored"
        />
        <Header />
        <div className="body-content">
          <Suspense
            fallback={
              <div className="loader-area">
                <div className="loader-item">
                  <div className="loader"></div>
                </div>
              </div>
            }
          >
            <Routes>
              {siteRoutes}
              <Route path="/search" element={<Search />} />
            </Routes>
          </Suspense>
        </div>
        <Footer />
      </div>
      <div id="gotoTop" className="icon-angle-up"></div>
    </div>
  );
}

export default App;
