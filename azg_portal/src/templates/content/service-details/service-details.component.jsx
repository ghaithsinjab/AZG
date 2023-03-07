import { useParams } from 'react-router-dom';
import parse from 'html-react-parser';

import PageBar from '../../../components/layout/page-bar/page-bar.component';
import Image from '../../../components/controls/image/image.component';

import { useServiceDetails } from '../../../hooks/services/services.hooks';
import { setSEO } from '../../../utils/helper.utils';

const ServiceDetails = ({page_bar}) => {
    
    const {item} = useParams();
    const serviceItem = useServiceDetails(item);
    
    const {attributes: {content, image: {data: {attributes: image}}, title}} = serviceItem || {attributes: {image:{data:{}}}};

    setSEO(title);

    return (
        <>
            <PageBar title={title} image={page_bar} />
            <section id="content">
                <div className="content-wrap py-0">

                    <section className="about py-5">
                        <div className="container">
                            
                            <div className="row justify-content-center">
                                <div className="col-lg-6 mb-4 mb-lg-0 align-self-center">
                                    {
                                        parse(content || '')
                                    }
                                </div>
                                {
                                    image ? (
                                        <div className="col-lg-6 align-self-center">
                                            <Image src={image?.url} alt={image?.alternativeText} className="img-fluid w-100" />
                                        </div>
                                    ) : ('')
                                }
                            </div>

                        </div>
                    </section>

                </div>
            </section>
        </>
    )
}

export default ServiceDetails;