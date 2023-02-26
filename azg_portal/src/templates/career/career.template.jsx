import { useSelector } from "react-redux";
import { selectNav } from "../../store/nav/nav.selectors";
import { getCurrentNav } from "../../utils/helper.utils";
import PageBar from "../../components/layout/page-bar/page-bar.component";

const Careers = () => {
    const nav = useSelector(selectNav);
    const currentNav = getCurrentNav(nav);

    if (!currentNav) return (<div></div>);

    const {related} = currentNav;
    const {title, page_bar} = related;

    return (
        <>
            <PageBar title={title} image={page_bar} />
        </>
    )
}

export default Careers;