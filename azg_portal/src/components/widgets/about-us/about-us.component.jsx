import {Link} from 'react-router-dom';
import Image from '../../controls/image/image.component';
import parse from 'html-react-parser';

const AboutUs = ({item}) => {
    return (
        <>
        {
            item && (
                <section className="about py-5">
                    <div className="container">
                        <div className="row justify-content-center">
                            <div className="col-lg-6 mb-4 mb-lg-0 align-self-center">
                                <div className="section-title">
                                    <h3 className="fw-bold text-uppercase">{item?.title}</h3>
                                </div>
                                <div>{parse(item?.content)}</div>
                                {
                                    item?.url?.length ? (<Link to={item?.url} className="btn float-end">Read More</Link>) : ('')
                                }
                            </div>
                            {
                                item?.image ? (
                                    <div className="col-lg-6 align-self-center">
                                        <Image 
                                            src={item?.image?.data?.attributes?.url} 
                                            alt={item?.image?.data?.attributes?.alternativeText || ''} 
                                            className="img-fluid w-100" />
                                    </div>
                                ) : ('')
                            }
                        </div>
                    </div>
                </section>
            )
        }
        </>
    )
}

export default AboutUs;