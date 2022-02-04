#!/bin/bash
set -x

# On définit la variable en constante
# avec readonly et l'indication en majuscule
readonly NOTE_FILENAME="notes.txt"

verbose_mode=false
if [[ $# -eq 3 ]]; then
    template_dir=$1
    course_file=$2
    output_dir=$3
elif [[ $# -eq 4 ]]; then
    if [[ $1 == "-v" || $2 == "--verbose" ]]; then
        verbose_mode=true
    else
    echo "Invalid first flag. expected -v|--verbose"
    exit -1
    fi

    template_dir=$2
    course_file=$3
    output_dir=$4
else
    echo "Invalid arguments count"
    exit -1
fi

if [[ $verbose_mode = true ]]; then
    echo "---------------------------------"
    echo "Course init summary"
    echo "---------------------------------"
    echo "template dir=$template_dir"
    echo "course file=$course_file"
    echo "output dir=$output_dir"
    echo
fi


while IFS= read -r course_name
do
    # Init des variables de chemin
    course_dir="$output_dir/$course_name"
    notes_src_file="$course_dir/$NOTE_FILENAME"
    notes_dst_file="$course_dir/notes-$course_name.txt"

    if [[ $verbose_mode = true ]]; then
        echo "Initializing directory structure for "$course_name" at path=$course_dir..."
    fi

    # Création de l'arborescence de fichiers
    mkdir -p $course_dir

    # Copie du template
    cp -r $template_dir/* $course_dir/

    # Renommage du fichier de notes
    mv $notes_src_file $notes_dst_file

    # Remplacement du titre dans le fichier de notes
    sed -i "s/<Course Title>/Cours $course_name/g" $notes_dst_file
done < "$course_file"


if [[ $verbose_mode = true ]]; then
    echo
    echo "Finished!"
fi
