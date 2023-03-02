import Slider from "../../components/widgets/slider/slider.component";
import AboutUs from "../../components/widgets/about-us/about-us.component";
import Businesses from "../../components/widgets/businesses/businesses.component";
import Briefs from "../../components/widgets/briefs/briefs.component";
// import {useHomePage} from '../../hooks/home-page/home-page.hooks';
// import { useServices } from "../../hooks/services/services.hooks";
import { useEffect, useState } from "react";
import { httpGetHomePage } from "../../hooks/home-page/home-page.requests";
import { httpGetServices } from "../../hooks/services/services.requests";

const Home = ()  => {
    // const homePage = useHomePage();
    //const services = useServices();
    const [homePage, setHomePage] = useState(undefined);
    const [services, setServices] = useState(undefined);
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {

        const getData = async () => {
            setIsLoading(true);
            const homePageResults = await httpGetHomePage();
            setHomePage(homePageResults);
            const servicesResults = await httpGetServices();
            setServices(servicesResults)
            setIsLoading(false);
        }

        getData();
        
    }, []);

    return (
        <>
            {
                isLoading ? (
                    <div className="loader-area">
                        <div className="loader-item">
                        <div className="loader"></div>
                        </div>
                    </div>
                ) : ('')
            }
            <Slider slides={homePage?.attributes?.slider} />
            <section id="content">
                <div className="content-wrap py-0">
                    <AboutUs item={homePage?.attributes?.about_us} />
                    <Businesses 
                        title={homePage?.attributes?.business_section_title} 
                        link_title={homePage?.attributes?.business_section_link_title} 
                        link_url={homePage?.attributes?.business_section_url} 
                        items={services} />
                    <Briefs title={homePage?.attributes?.brief_section_title} items={homePage?.attributes?.briefs} />
                </div>
            </section>
        </>
    )
}

export default Home;