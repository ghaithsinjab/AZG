import { useSelector } from "react-redux";
import { Suspense, lazy } from 'react';

import { getCurrentNav } from "../../utils/helper.utils";
import { selectNav } from "../../store/nav/nav.selectors";

const ServiceDetails = lazy(() => import('./service-details/service-details.component'));
const MediaDetails = lazy(() => import('./media-details/media-details.component'));

const Content = () => {

    const nav = useSelector(selectNav);
    const currentNav = getCurrentNav(nav);

    if (!currentNav) return (<div></div>);

    const {page_role, related} = currentNav;
    const {page_bar} = related;

    return (
        <>
            <Suspense>
                {
                    page_role && page_role === "Services" && <ServiceDetails page_bar={page_bar} />
                }
                {
                    page_role && page_role === "Media" && <MediaDetails page_bar={page_bar} />
                }
            </Suspense>
        </>
    )
}

export default Content;