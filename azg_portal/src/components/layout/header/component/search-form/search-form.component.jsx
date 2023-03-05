import { useNavigate, useSearchParams } from 'react-router-dom';
import { useEffect, useRef } from "react";
import { toast } from 'react-toastify';

import './search-form.styles.scss';

const SearchForm = ({forMobile}) => {
    const [searchParams] = useSearchParams();
    const navigate = useNavigate();
    const searchRef = useRef();

    const searchTerm = searchParams.get('q');

    const searchClickHandler = (e) => {
        e.preventDefault();
        const searchText = searchRef.current.value;
        searchText && searchText.length ? navigate(`/search?q=${searchText}`) : toast.warn('Please specify your search word!');
    }

    useEffect(() => {
        searchRef.current.value = searchTerm;
    }, [searchTerm]);

    return (
        <form className={`input-group search-area w-${forMobile?'100 my-4 px-2':'75'}`}>
            <input type="text" className="form-control" placeholder="Search.." ref={searchRef} />
            <button onClick={searchClickHandler} type="submit">
                <span className="input-group-text bg-transparent">
                    <i className="fas fa-search text-white"></i>
                </span>
            </button>
        </form>
    )
}

export default SearchForm;