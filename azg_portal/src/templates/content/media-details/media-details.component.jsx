import { useParams } from 'react-router-dom';
import parse from 'html-react-parser';

import PageBar from '../../../components/layout/page-bar/page-bar.component';
import Image from '../../../components/controls/image/image.component';

import { useMediaDetails } from '../../../hooks/media/media.hooks';
import { setSEO, getYouTubeId } from '../../../utils/helper.utils';

const MediaDetails = ({page_bar}) => {

    const {item} = useParams();
    const mediaItem = useMediaDetails(item);

    const {attributes: {title, content, image, youtube}} = mediaItem || {attributes:{}};
    const {attributes: contentImage} = image?.data || {data:{attributes:{}}};

    setSEO(title);

    return (
        <>
            <PageBar title={title} image={page_bar} />
            <section id="content">
                <div className="content-wrap py-0">

                    <section className="about py-5">
                        <div className="container">
                            
                            <div className="row justify-content-center">
                                {
                                    !(youtube && youtube.length) && (
                                        <div className="col-lg-6 mb-4 mb-lg-0 align-self-center">
                                            {
                                                parse(content || '')
                                            }
                                        </div>
                                    )
                                }
                                {
                                    !(youtube && youtube.length) && image ? (
                                        <div className="col-lg-6 align-self-center">
                                            <Image src={contentImage?.url} alt={contentImage?.alternativeText} className="img-fluid w-100" />
                                        </div>
                                    ) : ('')
                                }
                                {
                                    youtube && youtube.length && (
                                        <div className="col-lg-6 align-self-center">
                                            <iframe width="480" height="480" src={`https://www.youtube.com/embed/${getYouTubeId(youtube)}`}
                                                frameBorder="0"
                                                title={title}
                                                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                                                allowFullScreen
                                                style={{maxWidth: '100%'}}
                                            >
                                            </iframe>
                                        </div>
                                    )
                                }
                            </div>

                        </div>
                    </section>

                </div>
            </section>
        </>
    )
}

export default MediaDetails;