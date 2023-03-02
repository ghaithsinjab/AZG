import { useSelector } from "react-redux";
import {useState, useEffect} from 'react';
import { selectNav } from "../../store/nav/nav.selectors";
import { getCurrentNav } from "../../utils/helper.utils";
import PageBar from "../../components/layout/page-bar/page-bar.component";
import { httpGetCareer } from "../../hooks/career/career.requests";
import Vacancies from "./components/vacancies/vacancies.component";
import CareerForm from "./components/career-form/career-form.component";

const Careers = () => {
    const nav = useSelector(selectNav);
    const currentNav = getCurrentNav(nav);
    const [isLoading, setIsLoading] = useState(false);
    const [vacancies, setVacancies] = useState([]);
    const [selectedVacancy, setSelectedVacancy] = useState('');

    useEffect(() => {

        const getVacancies = async () => {
            setIsLoading(true);
            const results = await httpGetCareer();
            setIsLoading(false);
            setVacancies(results);
        }

        getVacancies();

    }, []);

    const selectVacancy = (key) => {
        const selected = vacancies.find(item => item.id === key);
        selected && selected.attributes && setSelectedVacancy(selected.attributes.title);
    }

    if (!currentNav) return (<div></div>);


    const {related} = currentNav;
    const {title, page_bar} = related;

    return (
        <>
            {
                isLoading ? (
                    <div className="loader-area">
                        <div className="loader-item">
                        <div className="loader"></div>
                        </div>
                    </div>
                ) : ('')
            }
            <PageBar title={title} image={page_bar} />
            <section id="content">
                <div className="content-wrap py-0">

                    <Vacancies vacancies={vacancies} selectJob={selectVacancy} />

                    <CareerForm selectedVacancy={selectedVacancy} />

                </div>
            </section>
        </>
    )
}

export default Careers;