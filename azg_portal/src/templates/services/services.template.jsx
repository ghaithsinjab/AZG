import { useSelector } from "react-redux";
import { selectNav } from "../../store/nav/nav.selectors";
import { getCurrentNav } from "../../utils/helper.utils";
import {useServices} from '../../hooks/services/services.hooks';

import PageBar from "../../components/layout/page-bar/page-bar.component";
import BusinessCard from "../../components/widgets/business-card/business-card.component";

const Services = () => {
    const nav = useSelector(selectNav);
    const currentNav = getCurrentNav(nav);
    const services = useServices();

    if (!currentNav) return (<div></div>);

    const {related} = currentNav;
    const {title, page_bar} = related;

    return (
        <>
            <PageBar title={title} image={page_bar} />

            <section id="content">
                <div className="content-wrap py-0">

                    <section className="business-listing py-5 eH-Area">
                        <div className="container">
                            <div className="row justify-content-center">
                                {
                                    services?.map(({id, attributes}) => (
                                        <div className="col-lg-4 mb-5" key={id}>
                                            <BusinessCard item={attributes} />
                                        </div>
                                    ))
                                }
                            </div>
                        </div>
                    </section>

                </div>
            </section>
        </>
    )
}

export default Services;