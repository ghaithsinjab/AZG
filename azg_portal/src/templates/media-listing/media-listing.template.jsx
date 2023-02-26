import { useSelector } from "react-redux";
import { selectNav } from "../../store/nav/nav.selectors";
import { getCurrentNav } from "../../utils/helper.utils";
import {useMedia} from '../../hooks/media/media.hooks';
import MediaCard from "../../components/widgets/media-card/media-card.component";
import PageBar from "../../components/layout/page-bar/page-bar.component";

import './media-listing.styles.scss';

const MediaListing = () => {
    const nav = useSelector(selectNav);
    const currentNav = getCurrentNav(nav);
    const media = useMedia();

    if (!currentNav) return (<div></div>);

    const {related} = currentNav;
    const {title, page_bar} = related;

    return (
        <>
            <PageBar title={title} image={page_bar} />

            <section id="content">
                <div className="content-wrap py-0">

                    <section className="media py-5 eH-Area">
                        <div className="container">
                            <div className="media-grid">
                                {
                                    media?.map(item => (
                                        <MediaCard key={item.id} item={item.attributes} />
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

export default MediaListing;