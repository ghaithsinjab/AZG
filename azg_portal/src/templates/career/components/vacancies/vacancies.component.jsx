import {EqualHeight, EqualHeightElement} from 'react-equal-height';
import parse from 'html-react-parser';

const Vacancies = ({vacancies, selectJob}) => {

    const selectJobHandler = (event) => {
        const key = Number(event.target.getAttribute('data-key'));
        key && selectJob && selectJob(key);
    }

    return (
        <section className="careers py-5">
            <div className="container">
                <EqualHeight>
                    <div className="row">                                
                        {
                            vacancies?.map(({id, attributes}) => (
                                <div className="col-lg-6 mb-4" key={id}>
                                    <div className="scale-item about-item mt-5">
                                        <div className="job-info">
                                            <h4 className="mb-1">{attributes?.title}</h4>
                                            <EqualHeightElement className="mb-0">
                                                {parse(attributes?.description)}
                                            </EqualHeightElement>
                                        </div>
                                        <h3 className="text-center fs-6" data-key={id} onClick={selectJobHandler}>
                                            Apply for This Job
                                        </h3>
                                    </div>
                                </div>
                            ))
                        }
                    </div>
                </EqualHeight>
            </div>
        </section>
    )
}

export default Vacancies;