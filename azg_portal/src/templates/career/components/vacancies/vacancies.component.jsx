import {EqualHeight, EqualHeightElement} from 'react-equal-height';
import parse from 'html-react-parser';

import './vacancies.styles.scss';

const Vacancies = ({vacancies, selectJob}) => {

    const selectJobHandler = (key) => {
        key && selectJob && selectJob(key);
        return false;
    }

    return (
        <section className="careers py-5">
            <div className="container">
                <EqualHeight>
                    <div className="row">                                
                        {
                            vacancies?.map(({id, attributes:{title, description}}) => (
                                <div className="col-lg-6 mb-4" key={id}>
                                    <div className="scale-item about-item mt-5">
                                        <div className="job-info">
                                            <h4 className="mb-1">{title}</h4>
                                            <EqualHeightElement className="mb-0">
                                                {parse(description)}
                                            </EqualHeightElement>
                                        </div>
                                        <h3 className="text-center fs-6" onClick={() => selectJobHandler(id)}>
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