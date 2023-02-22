import Slider from "../../components/widgets/slider/slider.component";
import AboutUs from "../../components/widgets/about-us/about-us.component";
import Businesses from "../../components/widgets/businesses/businesses.component";
import {useHomePage} from '../../hooks/home-page/home-page.hooks';
import { useServices } from "../../hooks/services/services.hooks";

const Home = ()  => {
    const homePage = useHomePage();
    const services = useServices();
    console.log(services);
    return (
        <>
            <Slider slides={homePage?.attributes?.slider} />
            <section id="content">
                <div className="content-wrap py-0">
                    <AboutUs item={homePage?.attributes?.about_us} />
                    <Businesses title={homePage?.attributes?.business_section_title} link_title={homePage?.attributes?.business_section_link_title} link_url={homePage?.attributes?.business_section_url} items={services} />
                </div>
            </section>
        </>
    )
}

export default Home;