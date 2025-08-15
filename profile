mkvenv() {
    # Default venv name is 'venv', but allow custom name
    local name="${1:-venv}"
 
    # Create virtual environment
    python -m venv "$name"
 
    # Activate it
    source "$name/Scripts/activate"
 
    # Upgrade pip and install pipreqs
    pip install --upgrade pip pipreqs
 
    # Generate requirements.txt based on imports
    pipreqs . --force
 
    echo "Virtual environment '$name' created, activated, and requirements.txt generated."
    echo "To deactivate: deactivate"
}
updatereq() {
    # Force generate requirements.txt for current folder
    pipreqs . --force
    echo "requirements.txt updated from imports."
}
