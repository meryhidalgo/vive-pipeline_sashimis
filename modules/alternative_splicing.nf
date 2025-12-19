
process seqAnalysis {
    publishDir "${params.output_dir}/splice_sites", mode: 'copy'
    
    input:
        path reference_fa
    output:
        path "*.tsv", emit: "tables"
    script:
    """
    #eval "\$(micromamba shell hook --shell=bash)"

    mkdir -p tmp/
    
    # extract the reference sequence
    #seq=`grep -v '^>' ${reference_fa} | tr -d '\\n'`

    # get splice score tables
    get_splice_sites.R \\
        $projectDir/bin/score5.pl \\
        $projectDir/bin/score3.pl \\
        tmp/ \\
        ${reference_fa} \\
        $projectDir/assets/splicemodels/me2x5 \\
        $projectDir/assets/splicemodels/splice5sequences \\
        $projectDir/assets/splicemodels/
   
    """
}
