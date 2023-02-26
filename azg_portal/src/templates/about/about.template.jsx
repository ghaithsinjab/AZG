import { useSelector } from "react-redux";
import { selectNav } from "../../store/nav/nav.selectors";
import { getCurrentNav } from "../../utils/helper.utils";
import {useHomePage} from '../../hooks/home-page/home-page.hooks';

import PageBar from "../../components/layout/page-bar/page-bar.component";
import Briefs from "../../components/widgets/briefs/briefs.component";
import Highlights from "./components/highlights/highlights.component";
import Content from "./components/content/content.component";
import Values from "./components/values/values.component";

const About = () => {
    const nav = useSelector(selectNav);
    const homePage = useHomePage();
    const currentNav = getCurrentNav(nav);

    if (!currentNav) return (<div></div>);

    const {related} = currentNav;
    const {title, content, content_image, highlights, values_title, values, page_bar} = related;
    
    return (
        <>
            <PageBar title={title} image={page_bar} />
            <section id="content">
                <div className="content-wrap py-0">

                    <section className="about py-5">
                        <div className="container">
                            
                            <Content title={title} content={content} image={content_image} />

                            <Highlights items={highlights} />

                        </div>
                    </section>
                    
                    <Values title={values_title} items={values} />
                    
                    <Briefs title={homePage?.attributes?.brief_section_title} items={homePage?.attributes?.briefs} />

                </div>
            </section>
        </>
    )
}

export default About;