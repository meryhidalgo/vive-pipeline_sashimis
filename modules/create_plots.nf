
process sashimi {
    tag "Sashimi-plot"

    publishDir "${params.output_dir}/sashimis", mode: 'copy', pattern: "*.pdf"

    input:
        path bam
        path bai
        path palette
    
    output:
        path "*.pdf"

    when:
        params.get_sashimis == true
    
    script:
    
    """
    
    /ggsashimi.py \\
        -b ${bam} \\
        -c ${params.sashimi_coords} \\
        --palette ${palette} \\
        -o sashimi_plot_min${params.sashimi_min_cov}.pdf \\
        -M ${params.sashimi_min_cov} \\
        --alpha ${params.sashimi_alpha} \\
        --ann-height ${params.sashimi_annot_height} \\
        --width ${params.sashimi_width} \\
        -C 3 --fix-y-scale\\
        ${params.sashimi_gtf_annotations ? '-g ${params.ref_gtf}' : ''}

    """

}
