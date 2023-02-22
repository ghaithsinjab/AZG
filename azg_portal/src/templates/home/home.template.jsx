import Slider from "../../components/widgets/slider/slider.component";
import {useHomePage} from '../../hooks/home-page/home-page.hooks';

const Home = ()  => {
    const homePage = useHomePage();
    console.log(homePage);
    return (
        <>
            <Slider slides={homePage?.attributes?.slider} />
        </>
    )
}

export default Home;