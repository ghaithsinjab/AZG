import BriefCard from "../brief-card/brief-card.component";

import './briefs.styles.scss';

const Briefs = ({title, items}) => {
    if (!items) return <></>;
    return (
        <section className="briefs py-5">
            <div className="container">
                {
                    (title && title.length && (
                        <div className="row">
                            <div className="col-6">
                                <div className="section-title">
                                    <h3 className="fw-bold text-uppercase">{title}</h3>
                                </div>
                            </div>
                        </div>
                    )) || ('')
                }
                <div className="row brief-area py-4 mt-4">
                    {
                        items?.map(item => <BriefCard item={item} key={item.id} />)
                    }
                </div>
            </div>
        </section>
    )
}

export default Briefs;