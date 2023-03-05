import { useState } from 'react';

import './input.styles.scss';

const Input = ({label, multiline = false, register, validations, ...otherProps}) => {

    const [value, setValue] = useState(otherProps.value || '');

    const {name} = otherProps;
    let registerProperties = {};
    if (register) registerProperties = {...register(name, validations)};

    const handleChange = (event) => {
        const v = event.target.value;
        setValue(v);
    }

    return (
        <div className='input-container'>
            {
                multiline ? (
                    <textarea {...otherProps} {...registerProperties} onChange={handleChange}></textarea>
                ) : (
                    <input {...otherProps} {...registerProperties} onChange={handleChange} />
                )
            }
            {
                label && (
                    <label className={value.length ? 'shrink' : ''}>{label}</label>
                )
            }
        </div>
    )

}

export default Input;