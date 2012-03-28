BGP06A5 ;IHS/CMI/LAB-CREATED BY ^ATXSTX ON MAY 23, 2010;
 ;;10.0;IHS CLINICAL REPORTING;;JUN 18, 2010
 ;
START ;
 K:'$G(ATXPGMC) ^TMP("ATX",$J)
 S ATXPGMC=$G(ATXPGMC)+1
 F ATXI=1:1 S X=$P($T(TMP+ATXI),";;",2,99) Q:X=""  S X="^TMP(""ATX"",$J,"_X,ATXI=ATXI+1,Y=$P($T(TMP+ATXI),";;",2,99) S @X=Y
 Q
 ;
TMP ;;TAXONOMY (WITH BULLETIN)
 ;;21,"00332-3111-01 ")
 ;;1567
 ;;21,"00332-3111-04 ")
 ;;1568
 ;;21,"00332-3113-05 ")
 ;;1569
 ;;21,"00332-4177-32 ")
 ;;1570
 ;;21,"00338-1021-41 ")
 ;;1571
 ;;21,"00338-1023-41 ")
 ;;1572
 ;;21,"00338-1025-41 ")
 ;;1573
 ;;21,"00338-3502-41 ")
 ;;1574
 ;;21,"00338-3503-41 ")
 ;;1575
 ;;21,"00338-5002-41 ")
 ;;1576
 ;;21,"00338-5003-41 ")
 ;;1577
 ;;21,"00364-0649-01 ")
 ;;1578
 ;;21,"00364-2029-90 ")
 ;;1579
 ;;21,"00364-2032-50 ")
 ;;1580
 ;;21,"00364-2032-90 ")
 ;;1581
 ;;21,"00364-2033-05 ")
 ;;1582
 ;;21,"00364-2033-50 ")
 ;;1583
 ;;21,"00364-2040-01 ")
 ;;1584
 ;;21,"00364-2041-50 ")
 ;;1585
 ;;21,"00364-2044-50 ")
 ;;1586
 ;;21,"00364-2063-05 ")
 ;;1587
 ;;21,"00364-2063-50 ")
 ;;1588
 ;;21,"00364-2068-01 ")
 ;;1589
 ;;21,"00364-2068-05 ")
 ;;1590
 ;;21,"00364-2068-90 ")
 ;;1591
 ;;21,"00364-2069-01 ")
 ;;1592
 ;;21,"00364-2069-05 ")
 ;;1593
 ;;21,"00364-2069-90 ")
 ;;1594
 ;;21,"00364-2076-16 ")
 ;;1595
 ;;21,"00364-2078-16 ")
 ;;1596
 ;;21,"00364-2144-61 ")
 ;;1597
 ;;21,"00364-2337-01 ")
 ;;1598
 ;;21,"00364-2464-34 ")
 ;;1599
 ;;21,"00364-2465-34 ")
 ;;1600
 ;;21,"00364-2466-93 ")
 ;;1601
 ;;21,"00364-2497-01 ")
 ;;1602
 ;;21,"00364-2498-50 ")
 ;;1603
 ;;21,"00364-2906-38 ")
 ;;1604
 ;;21,"00364-2908-61 ")
 ;;1605
 ;;21,"00378-0101-10 ")
 ;;1606
 ;;21,"00378-0102-01 ")
 ;;1607
 ;;21,"00378-0102-05 ")
 ;;1608
 ;;21,"00378-0106-01 ")
 ;;1609
 ;;21,"00378-0106-05 ")
 ;;1610
 ;;21,"00378-0107-01 ")
 ;;1611
 ;;21,"00378-0111-01 ")
 ;;1612
 ;;21,"00378-0111-10 ")
 ;;1613
 ;;21,"00378-0112-01 ")
 ;;1614
 ;;21,"00378-0112-10 ")
 ;;1615
 ;;21,"00378-0115-01 ")
 ;;1616
 ;;21,"00378-0115-05 ")
 ;;1617
 ;;21,"00378-0116-01 ")
 ;;1618
 ;;21,"00378-0116-05 ")
 ;;1619
 ;;21,"00378-0117-02 ")
 ;;1620
 ;;21,"00378-0117-04 ")
 ;;1621
 ;;21,"00378-0118-02 ")
 ;;1622
 ;;21,"00378-0118-04 ")
 ;;1623
 ;;21,"00378-0145-89 ")
 ;;1624
 ;;21,"00378-0148-05 ")
 ;;1625
 ;;21,"00378-0148-89 ")
 ;;1626
 ;;21,"00378-0167-05 ")
 ;;1627
 ;;21,"00378-0167-89 ")
 ;;1628
 ;;21,"00378-0195-01 ")
 ;;1629
 ;;21,"00378-0195-10 ")
 ;;1630
 ;;21,"00378-0198-01 ")
 ;;1631
 ;;21,"00378-0198-10 ")
 ;;1632
 ;;21,"00378-0204-01 ")
 ;;1633
 ;;21,"00378-0204-05 ")
 ;;1634
 ;;21,"00378-0205-05 ")
 ;;1635
 ;;21,"00378-0205-89 ")
 ;;1636
 ;;21,"00378-0206-02 ")
 ;;1637
 ;;21,"00378-0206-06 ")
 ;;1638
 ;;21,"00378-0207-02 ")
 ;;1639
 ;;21,"00378-0207-06 ")
 ;;1640
 ;;21,"00378-1204-05 ")
 ;;1641
 ;;21,"00378-1205-05 ")
 ;;1642
 ;;21,"00378-2116-01 ")
 ;;1643
 ;;21,"00378-6025-01 ")
 ;;1644
 ;;21,"00378-6025-05 ")
 ;;1645
 ;;21,"00378-6030-02 ")
 ;;1646
 ;;21,"00378-6030-04 ")
 ;;1647
 ;;21,"00378-6035-04 ")
 ;;1648
 ;;21,"00378-6050-01 ")
 ;;1649
 ;;21,"00378-6050-05 ")
 ;;1650
 ;;21,"00378-6400-01 ")
 ;;1651
 ;;21,"00378-6400-05 ")
 ;;1652
 ;;21,"00378-7250-01 ")
 ;;1653
 ;;21,"00378-7250-93 ")
 ;;1654
 ;;21,"00378-7500-01 ")
 ;;1655
 ;;21,"00378-7500-93 ")
 ;;1656
 ;;21,"00378-7602-06 ")
 ;;1657
 ;;21,"00378-7602-12 ")
 ;;1658
 ;;21,"00378-7604-02 ")
 ;;1659
 ;;21,"00378-7604-09 ")
 ;;1660
 ;;21,"00378-7610-06 ")
 ;;1661
 ;;21,"00378-7610-12 ")
 ;;1662
 ;;21,"00378-7612-02 ")
 ;;1663
 ;;21,"00378-7612-09 ")
 ;;1664
 ;;21,"00403-0357-30 ")
 ;;1665
 ;;21,"00403-0359-18 ")
 ;;1666
 ;;21,"00403-0361-18 ")
 ;;1667
 ;;21,"00403-0363-18 ")
 ;;1668
 ;;21,"00403-0365-18 ")
 ;;1669
 ;;21,"00403-0367-18 ")
 ;;1670
 ;;21,"00403-0369-21 ")
 ;;1671
 ;;21,"00403-0369-30 ")
 ;;1672
 ;;21,"00403-0601-02 ")
 ;;1673
 ;;21,"00403-0601-10 ")
 ;;1674
 ;;21,"00403-0601-14 ")
 ;;1675
 ;;21,"00403-0601-30 ")
 ;;1676
 ;;21,"00403-3027-20 ")
 ;;1677
 ;;21,"00403-3511-14 ")
 ;;1678
 ;;21,"00403-3511-20 ")
 ;;1679
 ;;21,"00403-5183-18 ")
 ;;1680
 ;;21,"00405-2275-70 ")
 ;;1681
 ;;21,"00405-2500-60 ")
 ;;1682
 ;;21,"00405-2500-70 ")
 ;;1683
 ;;21,"00405-3500-60 ")
 ;;1684
 ;;21,"00405-3500-70 ")
 ;;1685
 ;;21,"00405-3525-60 ")
 ;;1686
 ;;21,"00405-3525-70 ")
 ;;1687
 ;;21,"00405-3675-16 ")
 ;;1688
 ;;21,"00405-4083-01 ")
 ;;1689
 ;;21,"00405-4083-02 ")
 ;;1690
 ;;21,"00405-4084-02 ")
 ;;1691
 ;;21,"00405-4084-50 ")
 ;;1692
 ;;21,"00405-4086-01 ")
 ;;1693
 ;;21,"00405-4086-02 ")
 ;;1694
 ;;21,"00405-4089-01 ")
 ;;1695
 ;;21,"00405-4089-02 ")
 ;;1696
 ;;21,"00405-4090-01 ")
 ;;1697
 ;;21,"00405-4090-02 ")
 ;;1698
 ;;21,"00405-4152-02 ")
 ;;1699
 ;;21,"00405-4153-01 ")
 ;;1700
 ;;21,"00405-4153-02 ")
 ;;1701
 ;;21,"00405-4158-01 ")
 ;;1702
 ;;21,"00405-4159-01 ")
 ;;1703
 ;;21,"00405-4233-01 ")
 ;;1704
 ;;21,"00405-4322-01 ")
 ;;1705
 ;;21,"00405-4323-01 ")
 ;;1706
 ;;21,"00405-4377-02 ")
 ;;1707
 ;;21,"00405-4377-50 ")
 ;;1708
 ;;21,"00405-4378-50 ")
 ;;1709
 ;;21,"00405-4379-02 ")
 ;;1710
 ;;21,"00405-4379-50 ")
 ;;1711
 ;;21,"00405-4398-01 ")
 ;;1712
 ;;21,"00405-4398-02 ")
 ;;1713
 ;;21,"00405-4399-01 ")
 ;;1714
 ;;21,"00405-4399-02 ")
 ;;1715
 ;;21,"00405-4401-01 ")
 ;;1716
 ;;21,"00405-4411-01 ")
 ;;1717
 ;;21,"00405-4411-02 ")
 ;;1718
 ;;21,"00405-4680-01 ")
 ;;1719
 ;;21,"00405-4681-50 ")
 ;;1720
 ;;21,"00405-4762-01 ")
 ;;1721
 ;;21,"00405-4762-03 ")
 ;;1722
 ;;21,"00405-4763-01 ")
 ;;1723
 ;;21,"00405-4763-03 ")
 ;;1724
 ;;21,"00405-4768-01 ")
 ;;1725
 ;;21,"00405-4768-03 ")
 ;;1726
 ;;21,"00405-4769-01 ")
 ;;1727
 ;;21,"00405-4769-03 ")
 ;;1728
 ;;21,"00405-4928-01 ")
 ;;1729
 ;;21,"00405-4929-01 ")
 ;;1730
 ;;21,"00405-4929-02 ")
 ;;1731
 ;;21,"00405-4971-01 ")
 ;;1732
 ;;21,"00405-4976-01 ")
 ;;1733
 ;;21,"00405-4976-03 ")
 ;;1734
 ;;21,"00405-4981-01 ")
 ;;1735
 ;;21,"00405-4981-03 ")
 ;;1736
 ;;21,"00409-4050-01 ")
 ;;1737
 ;;21,"00409-4051-01 ")
 ;;1738
 ;;21,"00409-4052-01 ")
 ;;1739
 ;;21,"00409-4053-03 ")
 ;;1740
 ;;21,"00409-4054-03 ")
 ;;1741
 ;;21,"00409-4055-03 ")
 ;;1742
 ;;21,"00409-4197-01 ")
 ;;1743
 ;;21,"00409-4765-86 ")
 ;;1744
 ;;21,"00409-4778-86 ")
 ;;1745
 ;;21,"00409-6476-44 ")
 ;;1746
 ;;21,"00409-6482-01 ")
 ;;1747
 ;;21,"00409-7332-01 ")
 ;;1748
 ;;21,"00409-7333-04 ")
 ;;1749
 ;;21,"00409-7333-49 ")
 ;;1750
 ;;21,"00409-7334-10 ")
 ;;1751
 ;;21,"00409-7335-03 ")
 ;;1752
 ;;21,"00409-7336-04 ")
 ;;1753
 ;;21,"00409-7336-49 ")
 ;;1754
 ;;21,"00409-7337-01 ")
 ;;1755
 ;;21,"00409-7338-01 ")
 ;;1756
 ;;21,"00430-0111-20 ")
 ;;1757
 ;;21,"00430-0112-24 ")
 ;;1758
 ;;21,"00430-0696-24 ")
 ;;1759
 ;;21,"00430-0780-19 ")
 ;;1760
 ;;21,"00430-0836-20 ")
 ;;1761
 ;;21,"00430-0838-19 ")
 ;;1762
 ;;21,"00430-2782-15 ")
 ;;1763
 ;;21,"00430-2782-17 ")
 ;;1764
 ;;21,"00430-2783-16 ")
 ;;1765
 ;;21,"00430-2783-17 ")
 ;;1766
 ;;21,"00463-5001-01 ")
 ;;1767
 ;;21,"00463-5001-10 ")
 ;;1768
 ;;21,"00463-5002-16 ")
 ;;1769
 ;;21,"00463-5003-10 ")
 ;;1770
 ;;21,"00463-5011-01 ")
 ;;1771
 ;;21,"00463-5011-10 ")
 ;;1772
 ;;21,"00463-5012-01 ")
 ;;1773
 ;;21,"00463-5012-10 ")
 ;;1774
 ;;21,"00463-5015-01 ")
 ;;1775
 ;;21,"00463-5015-15 ")
 ;;1776
 ;;21,"00463-5016-01 ")
 ;;1777
 ;;21,"00463-5016-15 ")
 ;;1778
 ;;21,"00463-5017-10 ")
 ;;1779
 ;;21,"00463-5019-01 ")
 ;;1780
 ;;21,"00463-5020-55 ")
 ;;1781
 ;;21,"00463-5023-10 ")
 ;;1782
 ;;21,"00463-6214-10 ")
 ;;1783
 ;;21,"00472-0971-16 ")
 ;;1784
 ;;21,"00472-0974-16 ")
 ;;1785
 ;;21,"00472-0977-16 ")
 ;;1786
 ;;21,"00472-0979-16 ")
 ;;1787
 ;;21,"00472-1284-16 ")
 ;;1788
 ;;21,"00472-1285-06 ")
 ;;1789
 ;;21,"00472-1285-09 ")
 ;;1790
 ;;21,"00472-1285-16 ")
 ;;1791
 ;;21,"00472-1285-33 ")
 ;;1792
 ;;21,"00485-0041-50 ")
 ;;1793
 ;;21,"00527-1335-01 ")
 ;;1794
 ;;21,"00527-1336-01 ")
 ;;1795
 ;;21,"00527-1338-25 ")
 ;;1796
 ;;21,"00527-1338-50 ")
 ;;1797
 ;;21,"00527-1382-01 ")
 ;;1798
 ;;21,"00527-1383-01 ")
 ;;1799
 ;;21,"00527-1383-02 ")
 ;;1800
 ;;21,"00527-1384-01 ")
 ;;1801
 ;;21,"00527-1385-01 ")
 ;;1802
 ;;21,"00527-1386-50 ")
 ;;1803
 ;;21,"00527-1442-01 ")
 ;;1804
 ;;21,"00527-1443-01 ")
 ;;1805
 ;;21,"00527-1443-05 ")
 ;;1806
 ;;21,"00536-0105-71 ")
 ;;1807
 ;;21,"00536-0230-05 ")
 ;;1808
 ;;21,"00536-1375-01 ")
 ;;1809
 ;;21,"00536-1482-01 ")
 ;;1810
 ;;21,"00536-1492-06 ")
 ;;1811
 ;;21,"00536-1725-85 ")
 ;;1812
 ;;21,"00536-4692-01 ")
 ;;1813
 ;;21,"00555-0010-02 ")
 ;;1814
 ;;21,"00555-0010-05 ")
 ;;1815
 ;;21,"00555-0011-02 ")
 ;;1816
 ;;21,"00555-0011-05 ")
 ;;1817
 ;;21,"00555-0215-22 ")
 ;;1818
 ;;21,"00555-0215-23 ")
 ;;1819
 ;;21,"00555-0259-02 ")
 ;;1820
 ;;21,"00555-0259-04 ")
 ;;1821
 ;;21,"00555-0379-87 ")
 ;;1822
 ;;21,"00555-0380-87 ")
 ;;1823
 ;;21,"00555-0445-21 ")
 ;;1824
 ;;21,"00555-0445-22 ")
 ;;1825
 ;;21,"00555-0445-23 ")
 ;;1826
 ;;21,"00555-0582-02 ")
 ;;1827
 ;;21,"00555-0582-10 ")
 ;;1828
 ;;21,"00555-0584-02 ")
 ;;1829
 ;;21,"00555-0584-04 ")
 ;;1830
 ;;21,"00555-0694-02 ")
 ;;1831
 ;;21,"00555-0695-02 ")
 ;;1832
 ;;21,"00555-0696-10 ")
 ;;1833
 ;;21,"00555-0814-02 ")
 ;;1834
 ;;21,"00555-0815-02 ")
 ;;1835
 ;;21,"00555-0816-10 ")
 ;;1836
 ;;21,"00591-0309-01 ")
 ;;1837
 ;;21,"00591-0310-50 ")
 ;;1838
 ;;21,"00591-0410-01 ")
 ;;1839
 ;;21,"00591-0411-50 ")
 ;;1840
 ;;21,"00591-0498-05 ")
 ;;1841
 ;;21,"00591-0498-50 ")
 ;;1842
 ;;21,"00591-0499-05 ")
 ;;1843
 ;;21,"00591-0499-50 ")
 ;;1844
 ;;21,"00591-0500-50 ")
 ;;1845
 ;;21,"00591-1557-01 ")
 ;;1846
 ;;21,"00591-2365-69 ")
 ;;1847
 ;;21,"00591-2366-68 ")
 ;;1848
 ;;21,"00591-3120-01 ")
 ;;1849
 ;;21,"00591-3120-16 ")
 ;;1850
 ;;21,"00591-3153-01 ")
 ;;1851
 ;;21,"00591-3224-15 ")
 ;;1852
 ;;21,"00591-3225-15 ")
 ;;1853
 ;;21,"00591-3550-68 ")
 ;;1854
 ;;21,"00591-5440-05 ")
 ;;1855
 ;;21,"00591-5440-50 ")
 ;;1856
 ;;21,"00591-5535-50 ")
 ;;1857
 ;;21,"00591-5546-01 ")
 ;;1858
 ;;21,"00591-5546-05 ")
 ;;1859
 ;;21,"00591-5547-01 ")
 ;;1860
 ;;21,"00591-5547-05 ")
 ;;1861
 ;;21,"00591-5553-05 ")
 ;;1862
 ;;21,"00591-5553-50 ")
 ;;1863
 ;;21,"00591-5571-01 ")
 ;;1864
 ;;21,"00591-5694-01 ")
 ;;1865
 ;;21,"00591-5694-60 ")
 ;;1866
 ;;21,"00591-5695-50 ")
 ;;1867
 ;;21,"00591-5708-01 ")
 ;;1868
 ;;21,"00603-1202-58 ")
 ;;1869
 ;;21,"00603-1203-58 ")
 ;;1870
 ;;21,"00603-1206-58 ")
 ;;1871
 ;;21,"00603-1207-58 ")
 ;;1872
 ;;21,"00603-1687-58 ")
 ;;1873
 ;;21,"00603-1688-58 ")
 ;;1874
 ;;21,"00603-2267-28 ")
 ;;1875
 ;;21,"00603-2273-21 ")
 ;;1876
 ;;21,"00603-2274-21 ")
 ;;1877
 ;;21,"00603-2291-21 ")
 ;;1878
 ;;21,"00603-2291-28 ")
 ;;1879
 ;;21,"00603-2586-21 ")
 ;;1880
 ;;21,"00603-2595-21 ")
 ;;1881
 ;;21,"00603-2595-28 ")
 ;;1882
 ;;21,"00603-2596-21 ")
 ;;1883
 ;;21,"00603-2596-28 ")
 ;;1884
 ;;21,"00603-2619-21 ")
 ;;1885
 ;;21,"00603-2620-21 ")
 ;;1886
 ;;21,"00603-2909-21 ")
 ;;1887
 ;;21,"00603-3241-21 ")
 ;;1888
 ;;21,"00603-3242-21 ")
 ;;1889
 ;;21,"00603-3480-19 ")
 ;;1890
 ;;21,"00603-3481-19 ")
 ;;1891
 ;;21,"00603-3481-28 ")
 ;;1892
 ;;21,"00603-3482-19 ")
 ;;1893
 ;;21,"00603-3482-28 ")
 ;;1894
 ;;21,"00603-3548-21 ")
 ;;1895
 ;;21,"00603-3548-28 ")
 ;;1896
 ;;21,"00603-3551-21 ")
 ;;1897
 ;;21,"00603-3552-21 ")
 ;;1898
 ;;21,"00603-3552-28 ")
 ;;1899
 ;;21,"00603-3553-28 ")
 ;;1900
 ;;21,"00603-3554-21 ")
 ;;1901
 ;;21,"00603-4678-21 ")
 ;;1902
 ;;21,"00603-4679-19 ")
 ;;1903
 ;;21,"00603-5067-32 ")
 ;;1904
 ;;21,"00603-5068-21 ")
 ;;1905
 ;;21,"00603-5778-21 ")
 ;;1906
 ;;21,"00603-5779-28 ")
 ;;1907
 ;;21,"00603-5919-21 ")
 ;;1908
 ;;21,"00603-5919-32 ")
 ;;1909
 ;;21,"00603-5920-21 ")
 ;;1910
 ;;21,"00603-6500-64 ")
 ;;1911
 ;;21,"00603-6500-66 ")
 ;;1912
 ;;21,"00603-6500-84 ")
 ;;1913
 ;;21,"00603-6501-64 ")
 ;;1914
 ;;21,"00603-6501-66 ")
 ;;1915
 ;;21,"00603-6534-62 ")
 ;;1916
 ;;21,"00603-6534-66 ")
 ;;1917
 ;;21,"00603-6535-47 ")
 ;;1918
 ;;21,"00603-6535-64 ")
 ;;1919
 ;;21,"00603-6536-62 ")
 ;;1920
 ;;21,"00603-6536-66 ")
 ;;1921
 ;;21,"00603-6537-47 ")
 ;;1922
 ;;21,"00603-6537-64 ")
 ;;1923
 ;;21,"00603-6541-64 ")
 ;;1924
 ;;21,"00603-6541-68 ")
 ;;1925
 ;;21,"00603-6542-68 ")
 ;;1926
 ;;21,"00603-6563-64 ")
 ;;1927
 ;;21,"00603-6563-66 ")
 ;;1928
 ;;21,"00603-6563-68 ")
 ;;1929
 ;;21,"00603-6605-64 ")
 ;;1930
 ;;21,"00603-6605-68 ")
 ;;1931
 ;;21,"00603-6606-64 ")
 ;;1932
 ;;21,"00603-6606-68 ")
 ;;1933
 ;;21,"00603-8537-47 ")
 ;;1934
 ;;21,"00603-8563-68 ")
 ;;1935
 ;;21,"00615-0121-01 ")
 ;;1936
 ;;21,"00615-0124-01 ")
 ;;1937
 ;;21,"00615-0124-05 ")
 ;;1938
 ;;21,"00615-0124-13 ")
 ;;1939
 ;;21,"00615-0170-13 ")
 ;;1940
 ;;21,"00615-0170-43 ")
 ;;1941
 ;;21,"00615-0170-53 ")
 ;;1942
 ;;21,"00615-0170-63 ")
 ;;1943
 ;;21,"00615-0171-13 ")
 ;;1944
 ;;21,"00615-0180-01 ")
 ;;1945
 ;;21,"00615-0385-13 ")
 ;;1946
 ;;21,"00615-1310-13 ")
 ;;1947
 ;;21,"00641-2764-43 ")
 ;;1948
 ;;21,"00641-2765-43 ")
 ;;1949
 ;;21,"00641-2766-41 ")
 ;;1950
 ;;21,"00677-0562-02 ")
 ;;1951
 ;;21,"00677-0562-05 ")
 ;;1952
