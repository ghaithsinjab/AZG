import Image from '../../../../components/controls/image/image.component';
import parse from 'html-react-parser';

const Content = ({title, content, image}) => {
    return (
        <div className="row justify-content-center">
            <div className="col-lg-6 mb-4 mb-lg-0 align-self-center">
                <div className="section-title">
                    <h3 className="fw-bold text-uppercase">{title}</h3>
                </div>
                {parse(content)}
            </div>
            {
                image ? (
                    <div className="col-lg-6 align-self-center">
                        <Image src={image?.url} alt={image?.alternativeText} className="img-fluid w-100" />
                    </div>
                ) : ('')
            }
        </div>
    )
}

export default Content;