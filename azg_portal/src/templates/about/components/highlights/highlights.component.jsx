import {EqualHeight, EqualHeightElement} from 'react-equal-height';
import './highlights.styles.scss';

const Highlights = ({items}) => {
    return (
        <EqualHeight>
            <div className="row mt-5 eH-Area">
                {
                    items?.map(({id, title, text}) => (
                        <div key={id} className="col-lg-6 mb-4 mb-lg-0">
                            <div className="scale-item about-item mt-5">
                                <h3 className="text-center">{title}</h3>
                                <EqualHeightElement name="highlights">
                                    <p className="eH">{text}</p>
                                </EqualHeightElement>
                            </div>
                        </div>
                    ))
                }
            </div>
        </EqualHeight>
    )
}

export default Highlights;