import './input.styles.scss';

const Input = ({label, multiline = false, register, validations, ...otherProps}) => {
    const {name} = otherProps;
    return (
        <div className='input-container'>
            {
                multiline ? (
                    <textarea {...otherProps} {...register(name, validations)}></textarea>
                ) : (
                    <input {...otherProps} {...register(name, validations)} />
                )
            }
            {
                label && (
                    <label className={otherProps?.value.length ? 'shrink' : ''}>{label}</label>
                )
            }
        </div>
    )
}

export default Input;